
local SP = game.SinglePlayer()

function SWEP:fireM203(firstTimePrediction)
	if SERVER and SP then
		SendUserMessage("CW20_FIREM203", self.Owner)
	end
	
	self:delayEverything(0.6)
	self:setGlobalDelay(0.6)
	
	CustomizableWeaponry.grenadeTypes.selectFireFunc(self, firstTimePrediction)
	
	if self:filterPrediction() then
		self:MakeRecoil(5)
	end
	
	local suppressAmmoUsage = CustomizableWeaponry.callbacks.processCategory(wep, "shouldSuppressAmmoUsage")

	if not suppressAmmoUsage then
		self.M203Chamber = false
		
		CustomizableWeaponry.callbacks.processCategory(wep, "postConsumeAmmo")
	end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	if CLIENT then
		local vm 
	
		if self.ActiveAttachments.kk_ins2_gl_gp25 then
			vm = self.AttachmentModelsVM.kk_ins2_gl_gp25 and self.AttachmentModelsVM.kk_ins2_gl_gp25.ent
		elseif self.ActiveAttachments.kk_ins2_gl_m203 then
			vm = self.AttachmentModelsVM.kk_ins2_gl_m203 and self.AttachmentModelsVM.kk_ins2_gl_m203.ent
		end
		
		if IsValid(vm) then
			ParticleEffectAttach("muzzleflash_pistol", PATTACH_POINT_FOLLOW, vm, 1)
		end
	end
end

function SWEP:reloadM203()
	// moved to SWEP:Reload(), SWEP:beginReload() and SWEP:finishReload()
end

if CLIENT then
	usermessage.Hook("CW_KK_INS2_READYM203", function()
		local ply = LocalPlayer()
		if !IsValid(ply) then return end
		
		local wep = ply:GetActiveWeapon()
		if !IsValid(wep) or not wep.CW20Weapon then return end
			
		wep.M203Chamber = true
	end)
end

// GL unloading upon changing ammo

function SWEP:unloadM203()
	local give = 0

	if self.Primary.Ammo == "40MM" then
		give = self:Clip1()
		self:SetClip1(0)
	else
		give = self.M203Chamber and 1 or 0
		self.M203Chamber = false
	end
	
	if SERVER then
		self.Owner:GiveAmmo(give, "40MM", true)
		SendUserMessage("CW_KK_INS2_UNLOADM203", self.Owner)
	end	
end

if CLIENT then
	usermessage.Hook("CW_KK_INS2_UNLOADM203", function()
		local ply = LocalPlayer()
		if !IsValid(ply) then return end
		
		local wep = ply:GetActiveWeapon()
		if !IsValid(wep) or not wep.CW20Weapon then return end
			
		wep:unloadM203()
	end)
end

if SERVER then
	function SWEP:cycle40MMGrenades()
		CustomizableWeaponry.grenadeTypes.cycleGrenades(self)
		
		self:unloadM203()
		
		umsg.Start("CW20_GRENADETYPE", self.Owner)
			umsg.Short(self.Grenade40MM)
		umsg.End()
	end
end