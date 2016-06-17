if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Webley"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.Shell = "KK_INS2_762x33"
	SWEP.NoShells = true
	SWEP.ShellScale = 2
	
	SWEP.AttachmentModelsVM = {
		["kk_ins2_revolver_mag"] = {model = "models/weapons/upgrades/a_speedloader_webley.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		-- ["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_band.mdl", bone = "Weapon", pos = Vector(0, 3.437, 1.531), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		-- ["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_band.mdl", bone = "Weapon", pos = Vector(0, 3.437, 1.531), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		-- ["kk_ins2_anpeq15"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_anpeq_band.mdl", bone = "Weapon", pos = Vector(0, 3.437, 1.531), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_mak.mdl", bone = "Weapon", pos = Vector(0, 2.602, -0.06), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_mak.mdl", bone = "Weapon", pos = Vector(0, 2.602, -0.06), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
	}

	SWEP.IronsightPos = Vector(-1.8544, 0, 1.1093)
	SWEP.IronsightAng = Vector(-1.7862, 0.0008, 0)

	SWEP.CustomizationMenuScale = 0.01

	SWEP.SprintAnimSpeed = 1.1
	SWEP.ReloadViewBobEnabled = false
	SWEP.DisableSprintViewSimulation = true
	SWEP.HUD_MagText = "CYLINDER: "
end

SWEP.Attachments = {
	{header = "Reload Aid", offset = {500, -400}, atts = {"kk_ins2_revolver_mag"}},
	["+reload"] = {header = "Ammo", offset = {500, 150}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	draw = "base_ready",
	
	base_reload_start = "base_reload_start",
	base_reload_start_empty = "base_reload_start",
	base_insert = "base_reload_insert",
	base_reload_end = "base_reload_end",
	base_reload_end_empty = "base_reload_end",
	base_idle = "base_reload_end",	
	
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_fire = {"base_fire","base_fire2"},
	base_fire_aim = "iron_fire",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload_speed",
	base_reload_empty = "base_reload_speed",
	base_idle = "base_idle",
	base_holster = "base_holster",
	base_sprint = "base_sprint",
	base_safe = "base_down",
	base_safe_aim = "iron_down",
}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_webley.mdl"
SWEP.WorldModel		= "models/weapons/w_webley.mdl"

SWEP.WMPos = Vector(5.309, 1.623, -1.616)
SWEP.WMAng = Vector(-3, -5, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted()

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".38 Special"

SWEP.FireDelay = 60/380
SWEP.FireSound = "CW_KK_INS2_REVOLVER_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_REVOLVER_FIRE_SUPPRESSED"
SWEP.Recoil = 2.6

SWEP.HipSpread = 0.039
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.35
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.25
SWEP.Shots = 1
SWEP.Damage = 30

SWEP.FirstDeployTime = 2.54
SWEP.DeployTime = 0.46

SWEP.ReloadTime = 3.6
SWEP.ReloadHalt = 4.2

SWEP.ReloadTime_Empty = 3.6
SWEP.ReloadHalt_Empty = 4.2

SWEP.ReloadStartTime = 2.36
SWEP.ReloadStartTimeEmpty = 2.36
SWEP.InsertShellTime = 0.98
SWEP.ReloadFinishWait = 1.74
SWEP.ReloadFinishWaitEmpty = 1.74

SWEP.CanRestOnObjects = false
SWEP.Chamberable = false
SWEP.WeaponLength = 16

local bgBullets = 1
local bgShells = 2

function SWEP:IndividualInitialize()
	self.magType = "NONE"
	self.ShotgunReload = true
	
	if CLIENT then 
		self._lastLoadedAmount = 6
		self:setBodygroup(bgBullets,self._lastLoadedAmount)
		self:setBodygroup(bgShells,self._lastLoadedAmount)
	end
end

if CLIENT then 
	local makeShell = CustomizableWeaponry_KK.ins2.makeShell
	local random = math.random
	local velocity = Vector(0,0,50)
	
	local att, ang
	
	function SWEP:createShells()
		if self.Owner:ShouldDrawLocalPlayer() then
			return
		end
		
		if self._shellCoolDown and self._shellCoolDown > CurTime() then
			return
		end
		
		self._shellCoolDown = CurTime() + 3
		
		local shells = math.Clamp(self._lastLoadedAmount - self:Clip1(), 0, 6)
		
		for i = 1, shells do
			self._shellTable = self._shellTable1
			att = self.CW_VM:GetAttachment(2)
			ang = EyeAngles()
			
			ang:RotateAroundAxis(ang:Right(), random(-90, 90))
			ang:RotateAroundAxis(ang:Forward(), random(-90, 90))
			ang:RotateAroundAxis(ang:Up(), random(-90, 90))
			
			makeShell(self, att.Pos, ang, velocity, 0.6, 10)
		end
	end
end

if CLIENT then 
	function SWEP:updateOtherParts()
		local vm = self.CW_VM
		local cyc = vm:GetCycle()
		
		local clip = math.Clamp(self:Clip1(),0,6)
		
		local ammoType = self:getActiveAttachmentInCategory("+reload")
			local ammoSwitched = ammoType != self._lastAmmoType
			local unloadSwitched = self.unloadedMagazine and self.unloadedMagazine != self._lastUnload
			
			if ammoSwitched or unloadSwitched then
				self._lastLoadedAmount = 0
				self:setBodygroup(bgBullets,self._lastLoadedAmount)
				self:setBodygroup(bgShells,self._lastLoadedAmount)
			end
		self._lastUnload = self.unloadedMagazine
		self._lastAmmoType = ammoType
		
		if self.ShotgunReload then
			local dumping = self.Sequence == self.Animations.base_reload_start
			local loading = self.Sequence == self.Animations.base_insert
		
			if dumping then
				self:setBodygroup(bgBullets,clip)
				if cyc > 0.8 then
					self:setBodygroup(bgShells,0)
				end
				if cyc >= 0.7 then
					self:createShells()
				end
			elseif loading then				
				self._lastLoadedAmount = clip
				self:setBodygroup(bgShells,self._lastLoadedAmount)
			end
		else
			local dumping = self.Sequence == self.Animations.base_reload and cyc < 0.41
			local loading = self.Sequence == self.Animations.base_reload and cyc > 0.41 and cyc != 1
		
			if dumping then
				self:setBodygroup(bgBullets,clip)
				self:setBodygroup(bgShells,self._lastLoadedAmount)
				if cyc >= 0.4 then
					self:createShells()
				end
			elseif loading then
				local reserve
				
				if self.getFullestMag then
					reserve = math.max(self:Clip1(), self:getFullestMag(), -1)
				else
					reserve = self.Owner:GetAmmoCount(self.Primary.Ammo) + clip
				end
				
				self._lastLoadedAmount = math.Clamp(reserve,0,6)
				self:setBodygroup(bgBullets,self._lastLoadedAmount)
				self:setBodygroup(bgShells,self._lastLoadedAmount)
			end
		end
	end
end

function SWEP:beginReload()
	if SERVER then
		SendUserMessage("CW_KK_INS2_RELOADINACTIVITY", self.Owner)
	end
	
	if self.ShotgunReload then
		mag = self:Clip1()
	
		local time = CT + self.ReloadStartTime / self.ReloadSpeed
		
		self.lastMag = 0
		self.WasEmpty = mag == 0
		self.ReloadDelay = time
		self:SetNextPrimaryFire(time)
		self:SetNextSecondaryFire(time)
		self.GlobalDelay = time
		self.ShotgunReloadState = 1
		
		self:sendWeaponAnim("reload_start")
		
		CustomizableWeaponry.actionSequence.new(self, 1.6, nil, function()
			if self.ShotgunReloadState == 0 then return end // its also possible that its already 2 because user pressed attack button
			
			local amt = self:Clip1()
			self.Owner:SetAmmo(self.Owner:GetAmmoCount(self.Primary.Ammo) + amt, self.Primary.Ammo)
			self:SetClip1(0)
			
			self.ShotgunReloadState = 1
		end)
		
		CustomizableWeaponry.callbacks.processCategory(self, "beginReload", mag == 0)
		
		self.Owner:SetAnimation(PLAYER_RELOAD)
	else
		-- if CustomizableWeaponry.magSystem then
			-- weapons.GetStored("cw_base").unloadWeapon(self)
		-- end
		weapons.GetStored("cw_base").beginReload(self)
	end
end

local keyDown

function SWEP:finishReloadShotgun()
	CT = CurTime()
	
	if self.ShotgunReloadState == 1 then
		keyDown = self.Owner:KeyDown(IN_ATTACK) or self.Owner:KeyDown(IN_ATTACK2)
		
		if 0 < self:Clip1() and keyDown then
			self.ShotgunReloadState = 2
		end
		
		if CT > self.ReloadDelay then
			self:sendWeaponAnim(self:getForegripMode() .. "insert", self.ReloadSpeed)
			
			if SERVER and not SP then
				self.Owner:SetAnimation(PLAYER_RELOAD)
			end
			
			mag, ammo = self:Clip1(), self.Owner:GetAmmoCount(self.Primary.Ammo)
			
			if SERVER then
				self:SetClip1(mag + 1)
				self.Owner:SetAmmo(ammo - 1, self.Primary.Ammo)
			end
			
			self.ReloadDelay = CT + self.InsertShellTime / self.ReloadSpeed
			
			if mag + 1 >= self.Primary.ClipSize or ammo - 1 <= 0 then
				self.ShotgunReloadState = 2
			end
		end
	elseif self.ShotgunReloadState == 2 then
		if CT > self.ReloadDelay then			
			local anim = self:getForegripMode() .. "reload_end"
			local time = CT + self.ReloadFinishWait / self.ReloadSpeed
			
			if self.WasEmpty then
				anim = anim .. "_empty"
				time = CT + self.ReloadFinishWaitEmpty / self.ReloadSpeed
			end
			
			self:sendWeaponAnim(anim, self.ReloadSpeed)
			self.ShotgunReloadState = 0
			
			self:SetNextPrimaryFire(time)
			self:SetNextSecondaryFire(time)
			self.ReloadWait = time
			self.ReloadDelay = nil
		end
	end
end