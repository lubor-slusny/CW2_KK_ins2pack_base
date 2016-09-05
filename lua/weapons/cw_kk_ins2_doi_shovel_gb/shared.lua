if not CustomizableWeaponry then return end

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Shovel GB"
	
	SWEP.AttachmentModelsVM = {}
	
	SWEP.HUD_3D2DBone = 39
end

SWEP.Animations = {
	draw = "draw",

	base_pickup = "draw",
	base_draw = "draw",
	base_fire = {"base_attack_1", "base_attack_2", "base_attack_3", "abase_ttack_kill"},
	base_idle = "idle",
	base_holster = "holster",
	base_sprint = "sprint",
}

SWEP.NormalHoldType = "melee2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_kk_ins2_mel_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_etool_brit.mdl"
SWEP.WorldModel		= "models/weapons/w_etool_brit.mdl"

SWEP.WMPos = Vector(3.812, 1.544, -3.33)
SWEP.WMAng = Vector(99.385, -22.739, 18.048)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenade.models.ww2gb

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.doiContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.doiContentMounted()
