if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

SWEP.magType = "pistolMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Makarov"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.Shell = "KK_INS2_9x19"
	SWEP.ShellDelay = 0.06
	SWEP.ShellWorldAngleAlign = {Forward = 0, Right = 0, Up = 180}
	
	SWEP.AttachmentModelsVM = {		
		["kk_ins2_mag_makarov_8"] = {model = "models/weapons/upgrades/a_magazine_makarov_8.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_mag_makarov_15"] = {model = "models/weapons/upgrades/a_magazine_makarov_15.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_suppressor_pistol"] = {model = "models/weapons/upgrades/a_suppressor_pistol.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_mak.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_mak.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_m6x"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_m6x.mdl", bone = "Weapon", pos = Vector(-0.051, 1.011, -1.127), angle = Angle(0, -90, 0), size = Vector(0.85, 0.85, 0.85)},
		
		["kk_ins2_m6x_rail"] = {model = "models/cw2/attachments/lowerpistolrail.mdl", bone = "Weapon", pos = Vector(-0.049, 0.575, -0.477), angle = Angle(0, 90, 0), size = Vector(0.119, 0.119, 0.119), 
			material = "models/weapons/attachments/cw_kk_ins2_cstm_m6x/rail_gy",
		},
	}

	SWEP.AttachmentModelsWM = {
		["kk_ins2_suppressor_pistol"] = {model = "models/weapons/upgrades/w_sil_pistol.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_mag_makarov_8"] = {model = "models/weapons/upgrades/w_magazine_makarov_8.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_mag_makarov_15"] = {model = "models/weapons/upgrades/w_magazine_makarov_15.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-1.9038, 0, 0.46)
	SWEP.IronsightAng = Vector(0.2, 0.07, 0)

	SWEP.CustomizationMenuScale = 0.01
	SWEP.ReloadViewBobEnabled = false
	SWEP.DisableSprintViewSimulation = true
end

SWEP.Attachments = {
	{header = "Lasers", offset = {500, -400}, atts = {"kk_ins2_lam", "kk_ins2_flashlight", "kk_ins2_m6x"}},
	{header = "Barrel", offset = {-500, -400}, atts = {"kk_ins2_suppressor_pistol"}},
	{header = "Magazine", offset = {-500, 150}, atts = {"kk_ins2_mag_makarov_15"}},
	["+reload"] = {header = "Ammo", offset = {500, 150}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	draw = "base_ready",
	
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_draw_empty = "empty_draw",
	base_fire = {"base_fire","base_fire2","base_fire3"},
	base_fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	base_fire_last = "base_firelast",
	base_fire_last_aim = "iron_fire_last",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload",
	base_reload_mm = "base_reload_extmag",
	base_reload_empty = "base_reloadempty",
	base_reload_empty_mm = "base_reloadempty_extmag",
	base_idle = "base_idle",
	base_idle_empty = "empty_idle",
	base_holster = "base_holster",
	base_holster_empty = "empty_holster",
	base_sprint = "base_sprint",
	base_sprint_empty = "empty_sprint",
	base_safe = "base_down",
	base_safe_empty = "empty_down",
	base_safe_aim = "iron_down",
	base_safe_empty_aim = "empty_iron_down",
}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_makarov.mdl"
SWEP.WorldModel		= "models/weapons/w_makarov.mdl"

SWEP.WMPos = Vector(4.84, 1.608, -1.584)
SWEP.WMAng = Vector(-3, -5, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenades.models.f1
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnives.gurkha

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted()

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "9x18MM"

SWEP.FireDelay = 0.1
SWEP.FireSound = "CW_KK_INS2_MAKAROV_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_MAKAROV_FIRE_SUPPRESSED"
SWEP.Recoil = 0.77

SWEP.HipSpread = 0.034
SWEP.AimSpread = 0.012
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.22
SWEP.Shots = 1
SWEP.Damage = 23

SWEP.FirstDeployTime = 1.1
SWEP.DeployTime = 0.37

SWEP.ReloadTime = 2
SWEP.ReloadHalt = 2.65

SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt_Empty = 2.65

SWEP.CanRestOnObjects = false
-- SWEP.WeaponLength = 16 // original
SWEP.WeaponLength = 14

SWEP.KK_INS2_EmptyIdle = true

SWEP.MuzzleVelocity = 315

if CLIENT then 
	function SWEP:updateOtherParts()
		local active = self.ActiveAttachments
	
		self.AttachmentModelsVM.kk_ins2_mag_makarov_8.active = !active.kk_ins2_mag_makarov_15
	end
end
