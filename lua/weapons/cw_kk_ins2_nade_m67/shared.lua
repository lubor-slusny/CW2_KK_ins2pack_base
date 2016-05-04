if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M67 Frag"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "O"
	
	SWEP.AttachmentModelsVM = {		
		["kk_counter"] = {model = "models/weapons/stattrack.mdl", bone = "Spoon", rel = "", pos = Vector(-1.209, 0.05, -0.149), angle = Angle(0, 90, 20), size = Vector(0.419, 0.419, 0.419), ignoreKKBGO = true, active = true, nodraw = true},
	}
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 0.8
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
-- SWEP.grenadeEnt = "cw_grenade_thrown"
SWEP.grenadeEnt = "cw_kk_ins2_projectile_frag"

SWEP.Animations = {
	draw = "draw",
	throw = "throw",
	pullpin = "pullbackhigh",
	
	base_pickup = "base_draw",
	base_idle = "idle",
	base_draw = "draw",
	base_holster = "holster",
	base_sprint = "sprint",
	base_safe = "down",
}
	
local sounds = {
	{time = 0.2, sound = "CW_PINPULL"}
}

SWEP.Sounds = {
	base_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_GRENADE_DRAW"},
	},

	base_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_GRENADE_HOLSTER"},
	},

	base_crawl = {
		{time = 10/29, sound = "CW_KK_INS2_UNIVERSAL_RIGHTCRAWL"},
		{time = 20/29, sound = "CW_KK_INS2_UNIVERSAL_LEFTCRAWL"},
	},

	pullbackhigh = {
		{time = 19/30, sound = "CW_KK_INS2_M67_PINPULL"},
		{time = 20/30, sound = "CW_KK_INS2_M67_ARMDRAW"},
	},

	pullbackhighbake = {
		{time = 19/30, sound = "CW_KK_INS2_M67_PINPULL"},
		{time = 34/30, sound = "CW_KK_INS2_M67_ARMDRAW"},
	},

	pullbacklow = {
		{time = 19/30, sound = "CW_KK_INS2_M67_PINPULL"},
		{time = 20/30, sound = "CW_KK_INS2_M67_ARMDRAW"},
	},

	throw = {
		{time = 3/31.5, sound = "CW_KK_INS2_M67_THROW"},
	},

	bakethrow = {
		{time = 3/31.5, sound = "CW_KK_INS2_M67_THROW"},
	},

	lowthrow = {
		{time = 6/31.5, sound = "CW_KK_INS2_M67_THROW"},
	},
}
	
SWEP.SpeedDec = 5

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "grenade"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_kk_ins2_nade_base"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_cw_kk_ins2_m67.mdl"
SWEP.WorldModel		= "models/weapons/w_cw_kk_ins2_m67.mdl"

SWEP.WMPos = Vector(3.891, 2.295, -1.765)
SWEP.WMAng = Angle(-28.962, 155.365, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted()

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Frag Grenades"

-- SWEP.swapTime = 0.7

if CustomizableWeaponry_KK.HOME then 
	AddCSLuaFile("_src_go.lua")
	include("_src_go.lua")
end
