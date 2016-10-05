if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_anims.lua")
AddCSLuaFile("sh_callbacks.lua")
AddCSLuaFile("sh_utilities.lua")
AddCSLuaFile("sv_hooks.lua")
AddCSLuaFile("sh_nwext.lua")

AddCSLuaFile("cl_shells.lua")
AddCSLuaFile("o_cl_calcview.lua")
AddCSLuaFile("o_cl_hud.lua")
AddCSLuaFile("o_cl_model.lua")
AddCSLuaFile("o_sh_attacks.lua")
AddCSLuaFile("o_sh_m203.lua")
AddCSLuaFile("o_sh_think.lua")
AddCSLuaFile("o_shared.lua")

include("sh_anims.lua")
include("sh_callbacks.lua")
include("sh_utilities.lua")
include("sv_hooks.lua")
include("sh_nwext.lua")

include("o_sh_attacks.lua")
include("o_sh_m203.lua")
include("o_sh_think.lua")
include("o_shared.lua")

if CLIENT then
	include("cl_shells.lua")
	include("o_cl_calcview.lua")
	include("o_cl_hud.lua")
	include("o_cl_model.lua")
end

SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Knife Kitty"
SWEP.Contact		= "http://steamcommunity.com/profiles/76561198012236670/"
SWEP.Purpose		= "detaching shared functions"
SWEP.Instructions	= "dont spawn this directly, have phun"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.TSGlass = Material("models/weapons/optics/lense_rt")

-- SWEP.NoFreeAim = true
SWEP.LuaViewmodelRecoil = false

SWEP.KK_IGNORE_MAGSYS_TWEAK = true

SWEP.KKINS2Wep = true
SWEP.KKINS2RCE = false
SWEP.KKINS2Melee = false
SWEP.KKINS2Nade = false

SWEP.KK_INS2_EmptyIdle = false

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenade.models.m67
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnife.models.bayonet
SWEP.CW_KK_40MM_MDL = "models/weapons/upgrades/a_projectile_m203.mdl"

SWEP._KK_INS2_customEmptySuffix = ""
SWEP._KK_INS2_customReloadSuffix = ""

SWEP.DeployTime = 0.46
SWEP.HolsterTime = 0.46

SWEP.BipodDeployTime = 1.15
SWEP.BipodUndeployTime = 1.15

SWEP.FirstDeployTime = 5
SWEP.WeaponLength = 20

SWEP.HolsterSpeed = 1

SWEP.boltAction_isShot = false

if CLIENT then	
	SWEP.PosBasedMuz = false
	
	SWEP.MuzzleAttachmentName = "muzzle"
	SWEP.WorldMuzzleAttachmentID = 1
	
	SWEP.ShellScale = 1
	SWEP.ShellOffsetMul = 0
	SWEP.ShellViewAttachmentName = "shell"
	SWEP.ShellViewAngleAlign = {Forward = 0, Right = 0, Up = 0}
	SWEP.ShellWorldAttachmentID = 2
	SWEP.ShellWorldAngleAlign = {Forward = 0, Right = 0, Up = 0}
	
	SWEP.Shell2 = false
	
	SWEP.SwayIntensity = 0.7
	SWEP.AimSwayIntensity = 0.3
	SWEP.ZoomAmount = 0
	SWEP.FOVPerShot = 0
	
	SWEP.SprintAnimSpeed = 1.5
	SWEP.ViewModelMovementScale_sprint = 0
	SWEP.ViewModelMovementScale_base = 1
	
	SWEP.CW_KK_HANDS_MDL = "models/weapons/v_hands_vip.mdl"
	
	SWEP.knifeTime = 0
	
	SWEP.SprintPos = Vector(0, 0, 0)
	SWEP.SprintAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0, 0, 0)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203Pos = Vector(0, 0, 0)
	SWEP.M203Ang = Vector(0, 0, 0)
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0) 
	SWEP.LaserAngAdjust = Angle(0, 0, 0) 
	
	SWEP.IronsightPos = Vector(0, 0, 0)
	SWEP.IronsightAng = Vector(0, 0, 0)
end

SWEP.AttachmentExclusions = {
	["bg_foldsight"] = {"kk_ins2_magnifier", "kk_ins2_sights_cstm"}, 
	["kk_ins2_cstm_acog"] = {"kk_ins2_magnifier"}, 
	["kk_ins2_cstm_cmore"] = {"kk_ins2_magnifier"}, 
	["kk_ins2_cstm_barska"] = {"kk_ins2_magnifier"}, 
	["kk_ins2_cstm_microt1"] = {"kk_ins2_magnifier"}, 
	["kk_ins2_cstm_sureshot"] = {"kk_ins2_magnifier"}, 
	["kk_ins2_cstm_susat"] = {"kk_ins2_magnifier"}, 
	["kk_ins2_aimpoint"] = {"kk_ins2_sights_cstm"}, 
	["kk_ins2_elcan"] = {"kk_ins2_magnifier", "kk_ins2_sights_cstm"}, 
	["kk_ins2_eotech"] = {"kk_ins2_magnifier", "kk_ins2_sights_cstm"}, 
	["kk_ins2_kobra"] = {"kk_ins2_magnifier", "kk_ins2_sights_cstm"}, 
	["kk_ins2_po4"] = {"kk_ins2_magnifier", "kk_ins2_sights_cstm"}, 
	["kk_ins2_scope_m40"] = {"kk_ins2_magnifier", "kk_ins2_sights_cstm"}, 
	["kk_ins2_scope_mosin"] = {"kk_ins2_magnifier", "kk_ins2_sights_cstm"}, 
}

SWEP.AttachmentDependencies = {
	-- ["kk_ins2_aimpoint"] = {"kk_ins2_sights_base"}, 
	-- ["kk_ins2_elcan"] = {"kk_ins2_sights_base"}, 
	-- ["kk_ins2_eotech"] = {"kk_ins2_sights_base"}, 
	-- ["kk_ins2_kobra"] = {"kk_ins2_sights_base"}, 
	-- ["kk_ins2_po4"] = {"kk_ins2_sights_base"}, 
	-- ["kk_ins2_scope_m40"] = {"kk_ins2_sights_base"}, 
	-- ["kk_ins2_scope_mosin"] = {"kk_ins2_sights_base"}, 
	
	["kk_ins2_cstm_cmore"] = {"kk_ins2_sights_cstm"}, 
	["kk_ins2_cstm_barska"] = {"kk_ins2_sights_cstm"}, 
	["kk_ins2_cstm_eotechxps"] = {"kk_ins2_sights_cstm"}, 
	["kk_ins2_cstm_microt1"] = {"kk_ins2_sights_cstm"}, 
	["kk_ins2_cstm_compm4s"] = {"kk_ins2_sights_cstm"}, 
	["kk_ins2_cstm_acog"] = {"kk_ins2_sights_cstm"}, 
	["kk_ins2_cstm_susat"] = {"kk_ins2_sights_cstm"}, 
}

SWEP.autoCenterExclusions = {
	[CW_RUNNING] = true, 
	[CW_ACTION] = true, 
	[CW_HOLSTER_START] = true, 
	[CW_HOLSTER_END] = true, 
	[CW_AIMING] = true
}

local SP = game.SinglePlayer()
local MP = !SP

//-----------------------------------------------------------------------------
// CW_KK_MELEE is called by cw_kk_melee concommand
//-----------------------------------------------------------------------------

function SWEP:CW_KK_MELEE()
	if SERVER then
		if not self._KK_INS2_PickedUp then 
			return 
		end
		
		if self.KKINS2Melee then
			self:PrimaryAttack()
			return
		end
		
		if CustomizableWeaponry_KK.ins2.quickKnife:canAttack(self) then
			CustomizableWeaponry_KK.ins2.quickKnife:attack(self)
		end
	end
end

//-----------------------------------------------------------------------------
// IndividualThink for INS2 based sweps
// currently used by DOI BAR
//-----------------------------------------------------------------------------

function SWEP:IndividualThink_INS2() end

//-----------------------------------------------------------------------------
// IndividualThink for custom features
// - INS2 styled bolt-action weapons
// - crosshair, free aim settings enforcement
// - reload time updates
// - hands model changes
// - belt bodygroups updates on viewmodels
// - individual weapon properties updates
// - animated bipod state transitions
// - animated sprint, near-wall holster, safety firemode holster transitions
//-----------------------------------------------------------------------------

local cvarFA = GetConVar("cw_freeaim")
local cvarFAAC = GetConVar("cw_freeaim_autocenter")

local shouldDrawCrosshair, fa

function SWEP:IndividualThink()
	self.lastOwner = self.Owner

	self:IndividualThink_INS2()
	
	self:DrawShadow(false)
	
	self:doBoltAction()
	
	if SERVER then
		self:checkProneStatus()
	end
	
	if CLIENT then
		fa = cvarFA:GetInt()
		fa = (fa == 1) and cvarFAAC:SetInt(fa)
		-- self.NoFreeAim = self:isAiming()

		shouldDrawCrosshair = self.Owner:ShouldDrawLocalPlayer()
		self.CrosshairEnabled = shouldDrawCrosshair
		self.FadeCrosshairOnAim = !shouldDrawCrosshair
		
		-- if self.AttachmentModelsVM.kk_ins2_ww2_knife then
			-- self.DisableSprintViewSimulation = self.ActiveAttachments.kk_ins2_ww2_knife
		-- end
		
		if MP and not IsFirstTimePredicted() then return end
		
		// 2b removed
		// I guess
		self:updateReloadTimes()
		
		// and now, cosmetix
		
		self:updateHands()
		self:updateBelt()
		self:updateOtherParts()
		
		self:playSwitchBipod()
		self:playHolsterTransitions()
	end
end

//-----------------------------------------------------------------------------
// doBoltAction sets delays and plays bolt animation on shotguns/rifles
//-----------------------------------------------------------------------------

local prefix, suffix, anim, curDelay

function SWEP:doBoltAction()
	if self:Clip1() < 1 then
		self.boltAction_isShot = false
	end
	
	curDelay = math.max(self.GlobalDelay, self:GetNextPrimaryFire())
	
	if self:Clip1() > 0 and curDelay < CurTime() and self.boltAction_isShot and not self.Owner:KeyDown(IN_ATTACK) then
		local prefix = self:getForegripMode()
		local suffix = ""
		
		-- self.boltAction_isShot = false
		
		if self:isAiming() then
			suffix = "_aim"
		end
		
		anim = prefix .. "bolt" .. suffix
		
		if SP or IsFirstTimePredicted() then
			self:sendWeaponAnim(anim, 1, 0)
		end
		
		local time, halt = self:getAnimTimes(anim)
		
		local oldMAD = self.meleeAttackDelay or 0
		
		CustomizableWeaponry.actionSequence.new(self, time, nil, function()
			local newMAD = self.meleeAttackDelay or 0
			
			if math.abs(newMAD - oldMAD) < 0.1 then
				self.boltAction_isShot = false
			end
		end)
		
		halt = CurTime() + halt
		
		self:SetNextPrimaryFire(halt)
		self.GlobalDelay = halt
	end
end

//-----------------------------------------------------------------------------
// OnDrop 
// - prepares first deploy animation to be replayed
// - unloads allocated magazines if Mag System is installed
//-----------------------------------------------------------------------------

function SWEP:OnDrop(...)
	self:PrepareForPickup(true)
	
	if IsValid(self.lastOwner) then
		if self.allocatedMags and #self.allocatedMags > 0 then
			for _, roundCount in ipairs(self.allocatedMags) do
				self.lastOwner:GiveAmmo(roundCount, self.Primary.Ammo, true)
			end
			
			if self.magType then
				self.lastOwner:cwAddMagazine(self.magType, #self.allocatedMags)
			end
		end

		self.allocatedMags = {}
	end
end

//-----------------------------------------------------------------------------
// PrepareForPickup prepares first deploy animation to be played
//-----------------------------------------------------------------------------

SWEP._KK_INS2_PickedUp = true

local prefix, suffix

function SWEP:PrepareForPickup(drop)
	if not CustomizableWeaponry_KK.ins2.firstDeployEnabled then
		if CLIENT then
			self:drawAnimFunc()
		end
		
		return
	end
	
	self._KK_INS2_PickedUp = false
	
	if CLIENT and !drop then
		self:pickupAnimFunc()
	end
	
	CustomizableWeaponry.actionSequence.new(self, 0, nil, function()
		if CLIENT and IsFirstTimePredicted() then
			self:pickupAnimFunc()
		end
	end)

	CustomizableWeaponry.actionSequence.new(self, self.FirstDeployTime, nil, function()
		self._KK_INS2_PickedUp = true
	end)
	
	if SERVER then
		self.dt.INS2GLActive = false

		umsg.Start("CW_KK_INS2_PREPAREFORPICKUP")
			umsg.Entity(self)
		umsg.End()
	end
end

//-----------------------------------------------------------------------------
// CW_KK_INS2_PREPAREFORPICKUP message calls PrepareForPickup on client
//-----------------------------------------------------------------------------

if CLIENT then
	usermessage.Hook("CW_KK_INS2_PREPAREFORPICKUP", function(um)
		local wep = um:ReadEntity()
		
		if IsValid(wep) and wep.PrepareForPickup then
			wep:PrepareForPickup()
		end
	end)
end

//-----------------------------------------------------------------------------
// toggleGLMode is code from SecondaryAttack that switches INS2GLActive state, 
// edited for customized grenade launcher behavior
//-----------------------------------------------------------------------------

local anim, reloadTime, reloadHalt, flag, unloadTime

function SWEP:toggleGLMode(IFTP)
	if self._currentGrenadeLauncher.ww2GrenadeLauncher then
		if self.dt.INS2GLActive then
			if self.M203Chamber then
				anim = "gl_turn_off"
			else
				anim = "gl_turn_off_empty"
			end
			
			reloadTime, reloadHalt = self:getAnimTimes(anim)
			
			if self.M203Chamber then
				local oldMAD = self.meleeAttackDelay or 0
				
				CustomizableWeaponry.actionSequence.new(self, reloadTime, nil, function()
					local newMAD = self.meleeAttackDelay or 0
					
					if math.abs(newMAD - oldMAD) < 0.1 then
						self.dt.INS2GLActive = false
						self:unloadM203(true)
					end
				end)
			else
				self.dt.INS2GLActive = false
			end
		else
			if self.Owner:GetAmmoCount("40MM") < 1 then 
				return 
			end
			
			local clip = self:Clip1()
			
			if clip > 0 then
				anim = "gl_turn_on_full"
			else
				anim = "gl_turn_on"
			end
			
			reloadTime, reloadHalt, flag, unloadTime = self:getAnimTimes(anim)
			
			self.ReloadDelay = CurTime() + reloadTime
			
			if flag == KK_INS2_RIFLEGL_UNLOAD_ONE and clip > 0 then
				CustomizableWeaponry.actionSequence.new(self, unloadTime, nil, function()
					if not self.ReloadDelay then return end	// melee attack interruption
					
					self:SetClip1(clip - 1)
					self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Primary.Ammo) + 1, self.Primary.Ammo)
					
					self.dt.INS2GLActive = true
				end)
			else
				self.dt.INS2GLActive = true
			end
		end
	
		if (SERVER and SP) or (CLIENT and MP and IFTP) then
			self:sendWeaponAnim(anim, 1, 0)
		end
		
		self:delayEverything(reloadHalt)
		self:setGlobalDelay(reloadHalt)
	else
		if self.dt.INS2GLActive then
			self.dt.INS2GLActive = false
			anim = "gl_turn_off"
		else
			self.dt.INS2GLActive = true
			anim = "gl_turn_on"
		end
		
		if (SERVER and SP) or (CLIENT and MP and IFTP) then
			self:sendWeaponAnim(anim, 1.5, 0)
		end
		
		self:delayEverything(0.6)
		self:setGlobalDelay(0.6)
	end
end

//-----------------------------------------------------------------------------
// Prone Addon mashup
//-----------------------------------------------------------------------------

if SERVER then
	local wasProne, isProne
	local delay = 0.2
	
	function SWEP:checkProneStatus()
		if self.Owner.IsProne then
			wasProne = self._KK_INS2_wasProne
			isProne = self:IsOwnerCrawling()
			
			self._KK_INS2_wasProne = isProne
			
			if isProne and self.dt.State == CW_CUSTOMIZE then
				self.dt.State = CW_IDLE
			end
			
			if wasProne and !isProne then
				local t = math.max(self.GlobalDelay, CurTime() + delay)
				
				self:SetNextPrimaryFire(t)
				self.GlobalDelay = t
			end
		end
	end
end

function SWEP:IsOwnerProne()
	return self.Owner.IsProne and self.Owner:IsProne()
end

function SWEP:IsOwnerCrawling()
	return self:IsOwnerProne() and self.Owner:GetVelocity():Length() > 20
end
