if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Walther PPK"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.Shell = "KK_INS2_9x19"
		
	SWEP.AttachmentModelsVM = {		
	}

	SWEP.AttachmentModelsWM = {
		["md_tundra9mm"] = {model = "models/weapons/upgrades/w_sil_pistol.mdl", pos = Vector(0,0,0), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_mag_makarov_8"] = {model = "models/weapons/upgrades/w_magazine_makarov_8.mdl", pos = Vector(0,0,0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_mag_makarov_15"] = {model = "models/weapons/upgrades/w_magazine_makarov_15.mdl", pos = Vector(0,0,0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0,0,0), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0,0,0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-1.9131, 0, 0.5582)
	SWEP.IronsightAng = Vector(-0.0274, 0, 0)

	SWEP.CustomizationMenuScale = 0.01
	SWEP.ReloadViewBobEnabled = false
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false

SWEP.Attachments = {
	["+reload"] = {header = "Ammo", offset = {500, 50}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.KKINS_emptyIdle = true

SWEP.Animations = {
	draw = "base_ready", // coz drawanimfunc doesnt play always
	
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
	
SWEP.Sounds = {
	base_ready = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_DRAW"},
		{time = 4/30, sound = "CW_KK_INS2_MAKAROV_SAFETY"},
		{time = 9/30, sound = "CW_KK_INS2_MAKAROV_BOLTBACK"},
		{time = 19/30, sound = "CW_KK_INS2_MAKAROV_BOLTRELEASE"},
	},

	base_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_DRAW"},
	},

	base_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_HOLSTER"},
	},

	base_dryfire = {
		{time = 0/30, sound = "CW_KK_INS2_MAKAROV_EMPTY"},
	},

	base_reload = {
		{time = 0/30, sound = "CW_KK_INS2_MAKAROV_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_MAKAROV_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_MAKAROV_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_MAKAROV_MAGHIT"},
	},

	base_reload_extmag = {
		{time = 0/30, sound = "CW_KK_INS2_MAKAROV_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_MAKAROV_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_MAKAROV_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_MAKAROV_MAGHIT"},
	},

	base_reloadempty = {
		{time = 0/30, sound = "CW_KK_INS2_MAKAROV_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_MAKAROV_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_MAKAROV_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_MAKAROV_MAGHIT"},
		{time = 71/30, sound = "CW_KK_INS2_MAKAROV_BOLTRELEASE"},
	},

	base_reloadempty_extmag = {
		{time = 0/30, sound = "CW_KK_INS2_MAKAROV_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_MAKAROV_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_MAKAROV_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_MAKAROV_MAGHIT"},
		{time = 71/30, sound = "CW_KK_INS2_MAKAROV_BOLTRELEASE"},
	},

	empty_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_DRAW"},
	},

	empty_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_HOLSTER"},
	},

	iron_dryfire = {
		{time = 0, sound = "CW_KK_INS2_MAKAROV_EMPTY"},
	},
}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 WW2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_ppk.mdl"
SWEP.WorldModel		= "models/weapons/w_ppk.mdl"

SWEP.WMPos = Vector(4.84, 1.608, -1.584)
SWEP.WMAng = Vector(-3, -5, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenades.ww2de

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.ww2ContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.ww2ContentMounted()

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".22 LR"

SWEP.FireDelay = 0.1
SWEP.FireSound = "CW_KK_INS2_WW2_PPK_FIRE"
SWEP.Recoil = 0.77

SWEP.HipSpread = 0.034
SWEP.AimSpread = 0.012
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.22
SWEP.Shots = 1
SWEP.Damage = 19

SWEP.FirstDeployTime = 1.1
SWEP.DeployTime = 0.37

SWEP.ReloadTime = 2
SWEP.ReloadHalt = 2.65

SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt_Empty = 2.65
