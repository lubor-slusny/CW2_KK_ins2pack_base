local att = {}
att.name = "kk_ins2_cstm_eotechxps"
att.displayName = "EoTech XPS"
att.displayNameShort = "XPS"
att.aimPos = {"KKINS2CSTMEoTechXPSPos", "KKINS2CSTMEoTechXPSAng"}
att.FOVModifier = 15
att.isSight = true
-- att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT
att.statModifiers = {OverallMouseSensMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		[1] = {t = "Provides a bright reticle to ease aiming.", c = CustomizableWeaponry.textColors.POSITIVE}
	}
	
	att.reticle = "models/weapons/optics/eotech_reticule_holo"
	att._reticleSize = 14
	
	function att:elementRender()
		CustomizableWeaponry_KK.ins2.stencilSight(self, att)
	end
	
end

CustomizableWeaponry:registerAttachment(att)