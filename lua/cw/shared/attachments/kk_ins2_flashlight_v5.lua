local att = {}
att.name = "kk_ins2_flashlight5"
att.displayName = "Light Emitting Module v5"
att.displayNameShort = "LEM"
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_KK_FLASHLIGHT

att.statModifiers = {}

if CLIENT then
	-- att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.displayIcon = surface.GetTextureID("atts/wipshit")
	att.description = {
		[1] = {t = "FKIN MAGIC", c = CustomizableWeaponry.textColors.VPOSITIVE},
	}
	
	att.reticle = "cw2/reticles/aim_reticule"
	
	local model, beamAtt, pos, ang, col
	
	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end
		
		beamAtt = nil
		
		-- if (self._KK_INS2_LAM_MODE % 2) == 0 then return end
		
		if self.KK_INS2_FL_SRC_OVERRIDE then
			beamAtt = self:KK_INS2_FL_SRC_OVERRIDE()
		end
		
		if beamAtt == nil and self.AttachmentModelsVM[att.name] then
			model = self.AttachmentModelsVM[att.name].ent
			beamAtt = model:GetAttachment(model:LookupAttachment("Laser"))
		end
		
		if beamAtt == nil then
			model = self.CW_VM
			beamAtt = model:GetAttachment(model:LookupAttachment("Laser"))
		end

		CustomizableWeaponry_KK.ins2.flashlight.v2.elementRender(self, beamAtt)
		CustomizableWeaponry_KK.ins2.flashlight.v5.elementRender(self, beamAtt)
	end
end

function att:attachFunc()
	CustomizableWeaponry_KK.ins2.flashlight.v5.attach(self)
end

function att:detachFunc()
	CustomizableWeaponry_KK.ins2.flashlight.v5.detach(self)
end

CustomizableWeaponry:registerAttachment(att)