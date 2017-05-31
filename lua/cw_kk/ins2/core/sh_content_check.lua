
local WS_PACK_REVISION = 12

local baseGameContentOK = true
for _,f in pairs({
		"models/weapons/v_marinebayonet.mdl",
		"models/weapons/v_mp5kpdw.mdl",
		"models/weapons/w_flare_projectile.mdl",
		"models/weapons/w_p2a1.mdl",
		"models/weapons/shells/40mm.mdl",
		"models/weapons/shells/556x45_link.phy",
		"models/weapons/upgrades/a_modkit_mosin.mdl",
		"models/weapons/upgrades/a_projectile_gp25.phy",
		"models/weapons/upgrades/a_projectile_gp25.phy",
		"models/weapons/upgrades/w_standard_ak74.mdl",
	}) do
	
	baseGameContentOK = baseGameContentOK and file.Exists(f, "GAME")
end

local doiModContentOK = true
for _,f in pairs({
		"models/weapons/w_panzerfaust_projectile.mdl",
		"models/weapons/w_stielhandgranate.phy",
		"models/weapons/shells/garand_clip.phy",
		"models/weapons/upgrades/w_thompson_foregrip.mdl",
	}) do
	
	doiModContentOK = doiModContentOK and file.Exists(f, "GAME")
end

local doiGameContentOK = true
for _,f in pairs({
		"models/weapons/v_etool_brit.mdl",
		"models/weapons/w_bren.phy",
		"models/weapons/upgrades/a_bolt_springfield_ext.mdl",
		"models/weapons/upgrades/a_warhead_bazooka_2.mdl",
		"models/weapons/upgrades/w_enfield_gl.mdl",
	}) do
	
	doiGameContentOK = doiGameContentOK and file.Exists(f, "GAME")
end

local ao5ModContentOK = true
for _,f in pairs({
		"models/weapons/w_snub.mdl",
		"models/weapons/aof/v_flashgun.mdl",
		"models/weapons/aof/v_m79.mdl",
		"models/weapons/aof/w_machete.phy",
		"models/weapons/upgrades/w_flipup_br99.mdl",
	}) do
	
	ao5ModContentOK = ao5ModContentOK and file.Exists(f, "GAME")
end

local arseModContentOK = true
for _,f in pairs({
		"models/weapons/beretta/insguns_v_beretta.mdl",
		"models/weapons/l85/w_l85sight.mdl",
		"models/weapons/scar/a_scar_standardbarrel.mdl",
		"models/weapons/usp/w_uspmag.mdl",
		"models/weapons/upgrades/w_ugl.mdl",
	}) do
	
	arseModContentOK = arseModContentOK and file.Exists(f, "GAME")
end

local namModContentOK = true
for _,f in pairs({
		"models/weapons/v_nam_geballteladung.mdl",
		"models/weapons/v_nam_ithaca37.mdl",
		"models/weapons/v_nam_m26a2.mdl",
		"models/weapons/v_nam_m79.mdl",
		"models/weapons/v_nam_tokarev.mdl",
	}) do
	
	namModContentOK = namModContentOK and file.Exists(f, "GAME")
end

local extPackContentOK = CustomizableWeaponry_KK.ins2.ws == WS_PACK_REVISION

local subs
local sub = string.sub
local starts = string.StartWith

function CustomizableWeaponry_KK.ins2:isContentMounted4()
	subs = subs or {
		["cw_kk_ins2_doi"] = function() return (doiGameContentOK and (extPackContentOK)) end,
		["cw_kk_ins2_cstm"] = function() return (baseGameContentOK and (extPackContentOK)) end,
		["cw_kk_ins2_nam"] = function() return (doiGameContentOK and namModContentOK) end,
		["cw_kk_ins2_ao5"] = function() return (baseGameContentOK and ao5ModContentOK) end,
		["cw_kk_ins2_arse"] = function() return (baseGameContentOK and arseModContentOK and CustomizableWeaponry_KK.HOME) end,
		["cw_kk_ins2"] = function() return (baseGameContentOK and ao5ModContentOK) end,
		
		["baseGameContentOK"] = function() return baseGameContentOK end,
		["extPackContentOK"] = function() return extPackContentOK end,
		["doiGameContentOK"] = function() return doiGameContentOK end,
		["ao5ModContentOK"] = function() return ao5ModContentOK end,
		["arseModContentOK"] = function() return arseModContentOK end,
		["namModContentOK"] = function() return namModContentOK end,
	}
	
	-- local class = self.ClassName // only exists in instances
	local class = sub(self.Folder, 9)
	
	for k,f in pairs(subs) do
		if starts(class, k) then
			return f()
		end
	end
	
	return true
end

if CLIENT then
	local pos
	
	hook.Add("Think", "CW_KK_INS2_WS_UPDATE_NOTIFY", function()
		if not pos then 
			pos = LocalPlayer():GetPos()
			return
		end
		
		if LocalPlayer():GetPos():Distance(pos) > 100 then
			hook.Remove("Think", "CW_KK_INS2_WS_UPDATE_NOTIFY")
			
			if not (baseGameContentOK or doiGameContentOK) then
				chat.AddText(
					Color(200, 157, 96),
					"[KK INS2 SWEPS] ",
					Color(255, 255, 255),
					"Hi, required files are missing. Make sure you mount required content properly (according to guide on addon`s workshop page)."
				)
				
				return
			end
			
			if baseGameContentOK and CustomizableWeaponry_KK.ins2.ws != nil and CustomizableWeaponry_KK.ins2.ws < WS_PACK_REVISION then
				chat.AddText(
					Color(200, 157, 96),
					"[KK INS2 SWEPS] ",
					Color(255, 255, 255),
					"Hi, you seem to be using outdated EXT pack content. Make sure you download updated version from GitHub."
				)
				
				return
			end
			
			if doiGameContentOK and (CustomizableWeaponry_KK.ins2.ws == nil or CustomizableWeaponry_KK.ins2.ws < WS_PACK_REVISION) then
				chat.AddText(
					Color(200, 157, 96),
					"[KK INS2 SWEPS] ",
					Color(255, 255, 255),
					"Hi, Day Of Infamy sub-pack now requires EXT sub-pack in addition to standalone game. Refer to install-guide for more info."
				)
				
				return
			end
		end
	end)
end
