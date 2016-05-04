if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AC-556"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.Shell = "KK_INS2_556x45"
	
	SWEP.AttachmentModelsVM = {
		["kk_ins2_suppressor_sec"] = {model = "models/weapons/upgrades/a_suppressor_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/a_foregrip_sec2.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), attachment = "Foregrip"},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_band.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_band.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/a_optic_aimp2x_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},

		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/a_optic_aimpoint_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/a_optic_elcan_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/a_optic_eotech_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/a_optic_kobra.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/a_optic_po4x24_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		
		["kk_ins2_cstm_barska"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_barska.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.AttachmentModelsWM = {
		["kk_ins2_suppressor_sec"] = {model = "models/weapons/upgrades/w_sil_sec1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/w_foregrip_sec2.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/w_magaim.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	
		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/w_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/w_elcan.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/w_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/w_kobra.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/w_po.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_cstm_barska"] = {model = "models/weapons/upgrades/w_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-2.38, -2, 0.78)
	SWEP.IronsightAng = Vector(0, 0.03, 0)
	
	SWEP.KKINS2CSTMBarskaPos = Vector(-2.38, -3, -0.17)
	SWEP.KKINS2CSTMBarskaAng = Vector(0, 0, 0)

	SWEP.KKINS2AimpointPos = Vector(-2.38, -3, -0.17)
	SWEP.KKINS2AimpointAng = Vector(0, 0, 0)

	SWEP.KKINS2MagnifierPos = Vector(-2.38, -5, -0.17)
	SWEP.KKINS2MagnifierAng = Vector(-0.1, 0, 0)
	
	// sth sth sth theater
	
	SWEP.KKINS2EoTechPos = Vector(-2.3819, -3, 0.0127)
	SWEP.KKINS2EoTechAng = Vector(0, 0, 0)

	SWEP.KKINS2AimpointPos = Vector(-2.3828, -3, -0.029)
	SWEP.KKINS2AimpointAng = Vector(0, 0, 0)

	SWEP.KKINS2KobraPos = Vector(-2.3862, -3, -0.052)
	SWEP.KKINS2KobraAng = Vector(0, 0, 0)

	SWEP.KKINS2PO4Pos = Vector(-2.3313, -8, 0.0747)
	SWEP.KKINS2PO4Ang = Vector(0, 0, 0)

	SWEP.KKINS2ElcanPos = Vector(-2.3811, -6, -0.2809)
	SWEP.KKINS2ElcanAng = Vector(0, 0, 0)

	SWEP.KKINS2MagnifierPos = Vector(-2.38, -7, -0.0078)
	SWEP.KKINS2MagnifierAng = Vector(-0.1, 0, 0)

	SWEP.CustomizationMenuScale = 0.019
end

SWEP.WeaponLength = 20

SWEP.Attachments = {
	-- {header = "Sight", offset = {400, -500}, atts = {"kk_ins2_cstm_barska", "kk_ins2_aimpoint"}},
	{header = "Sight", offset = {400, -500}, atts = {"kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_po4"}},
	{header = "Barrel", offset = {-200, -500}, atts = {"kk_ins2_suppressor_sec"}},
	{header = "Under", offset = {-500, -100}, atts = {"kk_ins2_vertgrip"}},
	{header = "Extras", offset = {0, 100}, atts = {"kk_ins2_lam", "kk_ins2_flashlight", "kk_ins2_combo"}},
	{header = "More Sight", offset = {1000, -100}, atts = {"kk_ins2_magnifier"}, dependencies = CustomizableWeaponry_KK.ins2.magnifierDependencies},
	["+reload"] = {header = "Ammo", offset = {700, 300}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	draw = "base_ready",
	
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_fire = "base_fire",
	base_fire_aim = {"iron_fire","iron_fire_a","iron_fire_b","iron_fire_c","iron_fire_d","iron_fire_e","iron_fire_f"},
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload",
	base_reload_empty = "base_reloadempty",
	base_idle = "base_idle",
	base_holster = "base_holster",
	base_firemode = "base_fireselect",
	base_firemode_aim = "iron_fireselect",
	base_sprint = "base_sprint",
	base_safe = "base_down",
	base_safe_aim = "iron_down",
	
	foregrip_pickup = "foregrip_ready",
	foregrip_draw = "foregrip_draw",
	foregrip_fire = "foregrip_fire",
	foregrip_fire_aim = {"foregrip_iron_fire","foregrip_iron_fire_a","foregrip_iron_fire_b","foregrip_iron_fire_c","foregrip_iron_fire_d","foregrip_iron_fire_e","foregrip_iron_fire_f"},
	foregrip_fire_empty = "foregrip_dryfire",
	foregrip_fire_empty_aim = "foregrip_iron_dryfire_b",
	foregrip_reload = "foregrip_reload",
	foregrip_reload_empty = "foregrip_reloadempty",
	foregrip_idle = "foregrip_draw",
	foregrip_holster = "foregrip_holster",
	foregrip_firemode = "foregrip_iron_fireselect",
	foregrip_firemode_aim = "foregrip_iron_fireselect",
	foregrip_sprint = "foregrip_sprint",
	foregrip_safe = "foregrip_down",
	foregrip_safe_aim = "foregrip_iron_down",
}
	
SWEP.Sounds = {
	base_ready = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
		{time = 10/30, sound = "CW_KK_INS2_MINI14_BOLTBACK"},
		{time = 23/30, sound = "CW_KK_INS2_MINI14_BOLTRELEASE"},
	},

	base_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	base_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	base_dryfire = {
		{time = 0, sound = "CW_KK_INS2_MINI14_EMPTY"},
	},

	base_fireselect = {
		{time = 13/30, sound = "CW_KK_INS2_M14_FIRESELECT"},
	},

	base_reload = {
		{time = 19/30, sound = "CW_KK_INS2_MINI14_MAGRELEASE"},
		{time = 23/30, sound = "CW_KK_INS2_MINI14_MAGOUT"},
		{time = 63/30, sound = "CW_KK_INS2_MINI14_MAGIN"},
	},

	base_reloadempty = {
		{time = 16/30, sound = "CW_KK_INS2_MINI14_MAGRELEASE"},
		{time = 23/30, sound = "CW_KK_INS2_MINI14_MAGOUT"},
		{time = 63/30, sound = "CW_KK_INS2_MINI14_MAGIN"},
		{time = 101/30, sound = "CW_KK_INS2_MINI14_BOLTBACK"},
		{time = 115/30, sound = "CW_KK_INS2_MINI14_BOLTRELEASE"},
	},

	iron_dryfire = {
		{time = 0, sound = "CW_KK_INS2_MINI14_EMPTY"},
	},

	iron_fireselect = {
		{time = 13/30, sound = "CW_KK_INS2_M14_FIRESELECT"},
	},

	foregrip_ready = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
		{time = 10/30, sound = "CW_KK_INS2_MINI14_BOLTBACK"},
		{time = 23/30, sound = "CW_KK_INS2_MINI14_BOLTRELEASE"},
	},

	foregrip_draw_b = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_DRAW"},
	},

	foregrip_holster_b = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_HOLSTER"},
	},

	foregrip_dryfire_b = {
		{time = 0, sound = "CW_KK_INS2_MINI14_EMPTY"},
	},

	foregrip_fireselect = {
		{time = 13/30, sound = "CW_KK_INS2_M14_FIRESELECT"},
	},

	foregrip_reload = {
		{time = 19/30, sound = "CW_KK_INS2_MINI14_MAGRELEASE"},
		{time = 23/30, sound = "CW_KK_INS2_MINI14_MAGOUT"},
		{time = 63/30, sound = "CW_KK_INS2_MINI14_MAGIN"},
	},

	foregrip_reloadempty = {
		{time = 16/30, sound = "CW_KK_INS2_MINI14_MAGRELEASE"},
		{time = 23/30, sound = "CW_KK_INS2_MINI14_MAGOUT"},
		{time = 63/30, sound = "CW_KK_INS2_MINI14_MAGIN"},
		{time = 101/30, sound = "CW_KK_INS2_MINI14_BOLTBACK"},
		{time = 115/30, sound = "CW_KK_INS2_MINI14_BOLTRELEASE"},
	},

	foregrip_iron_dryfire_b = {
		{time = 0, sound = "CW_KK_INS2_MINI14_EMPTY"},
	},

	foregrip_iron_fireselect = {
		{time = 13/30, sound = "CW_KK_INS2_M14_FIRESELECT"},
	},
}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_mini14.mdl"
SWEP.WorldModel		= "models/weapons/w_mini14.mdl"

SWEP.WMPos = Vector(4.072, 0.924, -0.537)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted()

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.56x45MM"

SWEP.FireDelay = 0.08
SWEP.FireSound = "CW_KK_INS2_MINI14_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_MINI14_FIRE_SUPPRESSED"
SWEP.Recoil = 1.6

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 2.1
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 42

SWEP.FirstDeployTime = 1.4
SWEP.DeployTime = 0.5

SWEP.RecoilToSpread = 0.8 

SWEP.ReloadTime = 2.3
SWEP.ReloadTime_Empty = 2.3
SWEP.ReloadHalt = 3.1
SWEP.ReloadHalt_Empty = 4.6

SWEP.SnapToIdlePostReload = false