local att = {}
att.name = "kk_ins2_ww2_sling"
att.displayNameShort = "Sling"
att.displayName = "Weapon Sling"

att.statModifiers = {
	DrawSpeedMult = 0.5,
	HolsterSpeedMult = 0.5,
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		-- [1] = {t = "Boosts deploy speed of weapon that you switch to.", c = CustomizableWeaponry.textColors.VPOSITIVE},
	}

	function att:attachFunc()
		if not self.SlingBGs then return end

		self:setBodygroup(self.SlingBGs.main, self.SlingBGs.sling)
	end

	function att:detachFunc()
		if not self.SlingBGs then return end

		self:setBodygroup(self.SlingBGs.main, self.SlingBGs.none)
	end
end

CustomizableWeaponry:registerAttachment(att)

-- if CLIENT then
	-- CustomizableWeaponry:createStatText(att)
-- end
