local att = {}
att.name = "kk_ins2_cstm_acog"
att.displayName = "Trijicon ACOG"
att.displayNameShort = "ACOG"
att.aimPos = {"KKINS2CSTMACOGPos", "KKINS2CSTMACOGAng"}
att.FOVModifier = 15
att.isSight = true

att.statModifiers = {OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		-- [1] = {t = "Provides 4x magnification.", c = CustomizableWeaponry.textColors.POSITIVE},
		-- [2] = {t = "Narrow scope reduces awareness.", c = CustomizableWeaponry.textColors.NEGATIVE},
		-- [3] = {t = "Can be disorienting at close range.", c = CustomizableWeaponry.textColors.NEGATIVE}
	}

	att.zoomTextures = {
		{tex = surface.GetTextureID("cw2/reticles/reticle_chevron"), offset = {0, 1}}
	}
	
	att._rtFov = 4.5
	att._rtReticle = surface.GetTextureID("cw2/reticles/reticle_chevron")
	att._reticleMat = Material("cw2/reticles/reticle_chevron")
	
	function att:drawRenderTarget()
		local scopeEnt = self.AttachmentModelsVM[att.name].ent
		if self:isAiming() then 
			scopeEnt:SetSequence(1)
		else
			scopeEnt:SetSequence(2)
		end
		
		CustomizableWeaponry_KK.ins2.renderTargetSight(self, att)
	end
	
	function att:elementRender()
		CustomizableWeaponry_KK.ins2.renderTargetSightSetup(self, att)
	end
end

function att:attachFunc()
	self.OverrideAimMouseSens = 0.25
	self.SimpleTelescopicsFOV = 70
	self.AimViewModelFOV = 50
	self.BlurOnAim = true
	self.ZoomTextures = att.zoomTextures
end

function att:detachFunc()
	self.OverrideAimMouseSens = nil
	self.SimpleTelescopicsFOV = nil
	self.AimViewModelFOV = self.AimViewModelFOV_Orig
	self.BlurOnAim = false
end

CustomizableWeaponry:registerAttachment(att)