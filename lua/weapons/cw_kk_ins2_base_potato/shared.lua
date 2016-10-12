if not CustomizableWeaponry then return end

AddCSLuaFile()

SWEP.Base = "cw_kk_ins2_base_main"

SWEP.KKINS2Potato = true

local SP = game.SinglePlayer()
local MP = !SP

function SWEP:SetupDataTables()
	self:NetworkVar("Int", 0, "State")
	self:NetworkVar("Int", 1, "Shots")
	-- self:NetworkVar("Int", 2, "INS2LAMMode")
	self:NetworkVar("Float", 0, "HolsterDelay")
	self:NetworkVar("Bool", 0, "Suppressed")
	self:NetworkVar("Bool", 1, "Safe")
	self:NetworkVar("Bool", 2, "BipodDeployed")
	self:NetworkVar("Bool", 3, "INS2GLActive")
	self:NetworkVar("Angle", 0, "ViewOffset")
	self:NetworkVar("Entity", 0, "Potato")
end

local cvarFA = GetConVar("cw_freeaim")
local cvarFAAC = GetConVar("cw_freeaim_autocenter")

local shouldDrawCrosshair, fa

function SWEP:IndividualThink()
	self:DrawShadow(false)
	self.lastOwner = self.Owner
	
	self:IndividualThink_INS2()
	self:doBoltAction()
	self:processPotatos()
	
	if SERVER then
		self:checkProneStatus()
	end
	
	if CLIENT then
		fa = cvarFA:GetInt()
		fa = (fa == 1) and cvarFAAC:SetInt(fa)
		
		shouldDrawCrosshair = self.Owner:ShouldDrawLocalPlayer()
		self.CrosshairEnabled = shouldDrawCrosshair
		self.FadeCrosshairOnAim = !shouldDrawCrosshair
		
		if MP and not IsFirstTimePredicted() then return end
		
		self:updateReloadTimes()
		
		self:updateHands()
		self:updateBelt()
		self:updateOtherParts()
		
		self:playSwitchBipod()
		self:playHolsterTransitions()
	end
end

function SWEP:processPotatos()
	local is, was = IsValid(self.dt.Potato), self._potatoWas
	
	if is then
		if !was then
			self:animatePotatoPickup()
			self.potatoDelay = CurTime() + 0.5
		end
		
		if self.Owner:KeyDown(IN_USE) then
			local t = 1
			
			if CLIENT then
				self.grenadeTime = CurTime() + t
				self.reticleInactivity = UnPredictedCurTime() + t
			end
			
			self:forceState(CW_KK_QNADE, t, SP)
			
			if SERVER then
				self.dt.Potato:SetPos(self.Owner:EyePos())
			end
		elseif CurTime() > self.potatoDelay then
			self:throwPotato()
		end
	else
		if was then
			self:animatePotatoThrow()
		end
	end
	
	self._potatoWas = is
end

function SWEP:animatePotatoPickup()
	-- self.dt.Potato:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.dt.Potato:SetNoDraw(true)
	
	self.Animations["_potato_pickup"] = "throwback"
	self.Animations["_potato_throw"] = "bakethrow"
	
	self.dt.State = CW_ACTION
	
	CustomizableWeaponry.actionSequence.new(self, 0.1, nil, function()
		self.dt.State = CW_KK_QNADE
		
		if CLIENT then
			self.reticleInactivity = UnPredictedCurTime() + 1.5
			
			self.grenadeTime = CurTime() + 1.5
			self.CW_VM:SetModel(self.CW_GREN_TWEAK.vm)
			
			self:playAnim("_potato_pickup", 1, 0)
		end
	end)
end

function SWEP:animatePotatoThrow()
	
	self.Animations["_potato_pickup"] = "throwback"
	self.Animations["_potato_throw"] = "bakethrow"
	
	if CLIENT then
		self:playAnim("_potato_throw", 1, 0)
		
		CustomizableWeaponry.actionSequence.new(self, 1, nil, function()
			self.CW_VM:SetModel(self.ViewModel)
			self:idleAnimFunc()
		end)
	end
end

function SWEP:throwPotato()

	if SERVER then
		local nade = self.dt.Potato
		self.dt.Potato = nil
	
		if !IsValid(nade) then
			return 
		end
		
		nade:SetOwner(ply)
		nade:SetCollisionGroup(COLLISION_GROUP_NONE)
		
		nade:SetPos(self.Owner:EyePos())
		
		local velocity = CustomizableWeaponry.quickGrenade:getThrowVelocity(self.Owner)
		local phys = nade:GetPhysicsObject()
		
		if IsValid(phys) then
			phys:SetVelocity(velocity)
			phys:AddAngleVelocity(Vector(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500)))
		else
			nade:SetVelocity(velocity)
		end
		
		nade:SetNoDraw(false)
	end
end

if CLIENT then
	
	function SWEP:createCustomVM(mdl)
		self.CW_VM = self:createManagedCModel(mdl, RENDERGROUP_BOTH)
		self.CW_VM:SetNoDraw(true)
		self.CW_VM:SetupBones()
		
		self.CW_KK_HANDS = self:createManagedCModel(self.CW_KK_HANDS_MDL, RENDERGROUP_BOTH)
		self.CW_KK_HANDS:SetNoDraw(true)
		self.CW_KK_HANDS:SetupBones()
		
		self.CW_KK_HANDS:SetParent(self.CW_VM)
		self.CW_KK_HANDS:AddEffects(EF_BONEMERGE)
		
		self.WMEnt = self:createManagedCModel(self.WorldModel, RENDERGROUP_BOTH)
		self.WMEnt:SetNoDraw(true)
	end

	function SWEP:drawViewModel()
		if not self.CW_VM then
			return
		end
		
		self:offsetBones()
		
		FT = FrameTime()
		
		self.LuaVMRecoilIntensity = math.Approach(self.LuaVMRecoilIntensity, 0, FT * 10 * self.LuaVMRecoilLowerSpeed)
		self.LuaVMRecoilLowerSpeed = math.Approach(self.LuaVMRecoilLowerSpeed, 1, FT * 2)
		
		self:applyOffsetToVM()
		self:_drawViewModel()
	end

	local cvAmmoHud = GetConVar("cw_customhud_ammo")
	local cvSVM = GetConVar("cw_kk_ins2_shell_vm")

	function SWEP:_drawViewModel()
		self.CW_VM:FrameAdvance(FrameTime())
		self.CW_VM:SetupBones()
		self.CW_VM:DrawModel()
		
		self.CW_KK_HANDS:SetPos(self.CW_VM:GetPos())
		self.CW_KK_HANDS:DrawModel()
		
		local CT = CurTime()
		
		if CT > self.grenadeTime and CT > self.knifeTime then
			if cvSVM:GetInt() == 1 then
				self:drawVMShells()
			end
			
			self:drawAttachments()
			self:drawInteractionMenu()
			
			if self.reticleFunc then
				self.reticleFunc(self)
			end
			
			if cvAmmoHud:GetInt() >= 1 then
				self:draw3D2DHUD()
			end
		end
	end
	
	
end
