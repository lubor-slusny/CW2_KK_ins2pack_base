if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M9A1 'zooka"
	
	SWEP.SelectFont = "CW_SelectIcons2"
	SWEP.IconLetter = "i"
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.RearEffectw = true
	SWEP.NoShells = true
	
	SWEP.BackupSights = {
		["nil"] = {
			Vector(-1.4887, 0, -1.3139),
			Vector(7.5622, -0.9048, 13.5897)
		},
	}
	
	SWEP.AttachmentModelsVM = {
		["h347"] = {model = "models/weapons/upgrades/a_warhead_bazooka_1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_ammo_m10"] = {model = "models/weapons/upgrades/a_warhead_bazooka_2.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.AttachmentModelsWM = {}
	
	SWEP.IronsightPos = Vector(-1.7264, 0, -0.281)
	SWEP.IronsightAng = Vector(7.5622, -0.9048, 13.5897)

	SWEP.ActualSightPos = Vector(-1.7264, 0, -0.281)
	SWEP.ActualSightAng = Vector(7.5622, -0.9048, 13.5897)

	SWEP.SightBackUpPos = Vector(-1.4887, 0, -1.3139)
	SWEP.SightBackUpAng = Vector(7.5622, -0.9048, 13.5897)

	SWEP.SprintAnimSpeed = 1
	SWEP.ViewModelMovementScale_sprint = 0.6
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.CustomizationMenuScale = 0.02
	SWEP.HUD_MagText = "TUBE: "
end

SWEP.Chamberable = false
SWEP.WeaponLength = 44

SWEP.Attachments = {
	{header = "Ammo", offset = {600, -200}, atts = {"kk_ins2_ammo_m10"}},
}

SWEP.Animations = {
	base_insert = "base_reload",
	
	base_pickup = "base_ready",
	base_pickup_mm = "base_ready_phosphorus",
	base_draw = "base_draw",
	base_fire = "base_fire",
	base_fire_aim = "iron_fire",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload_empty = "base_reload",
	base_reload_empty_mm = "base_reload_phosphorus",
	base_idle = "base_idle",
	base_holster = "base_holster",
	base_sprint = "base_sprint",
	base_safe = "base_down",
	base_safe_aim = "iron_down",
	base_crawl = "base_crawl",
}

SWEP.SpeedDec = 15

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "rpg"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"single"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.AimViewModelFOV = 30
SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bazooka.mdl"
SWEP.WorldModel		= "models/weapons/w_bazooka.mdl"

SWEP.DrawCustomWM = true
SWEP.WMPos = Vector(-5, 0, -0.5)
SWEP.WMAng = Vector(8, 180, -180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenade.models.ww2us
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnife.models.ww2us

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.doiContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.doiContentMounted()

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "M6A1 Rocket"

SWEP.FireDelay = 0.3
SWEP.FireSound = "CW_KK_INS2_DOI_BAZOOKA_FIRE"
SWEP.Recoil = 0.5

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 1
SWEP.Damage = 100

SWEP.FirstDeployTime = 6.9 // so long
SWEP.DeployTime = 1
SWEP.HolsterTime = 1

SWEP.ReloadTimes = {
	base_ready = {4.7, 6.87},
	base_ready_phosphorus = {4.7, 6.87},
	base_reload = {4.4, 6.43},
	base_reload_phosphorus = {4.4, 6.43},
}

SWEP.reloadProgressAnimsRaw = {
	base_pickup = true,
	base_pickup_mm = true
}

local cyc, suffix

function SWEP:fireAnimFunc()
	cyc = 0.25
	suffix = ""
	
	if (self:Clip1() == 0) then
		cyc = 0
		suffix = "_empty"
	end
	
	if self:isAiming() then
		suffix = suffix .. "_aim"
	end
	
	self:sendWeaponAnim("base_fire" .. suffix, 1, cyc)
end //*/

if CLIENT then
	function SWEP:updateStandardParts()
		self:setElementActive("h347", !self.ActiveAttachments.kk_ins2_ammo_m10)
	end
end