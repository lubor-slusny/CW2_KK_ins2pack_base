AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Think()
	-- self:SetAngles(self:GetVelocity():Angle():Forward())
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

local vel, len

function ENT:PhysicsCollide(data, physobj)
	if math.abs(data.OurOldVelocity:Length() - self:GetVelocity():Length()) > 5 then
		self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav", 80, 100)
	end
		
	local impactAngle = math.deg(math.acos(data.OurOldVelocity:GetNormalized():Dot(data.HitNormal:GetNormalized()))) // so much math
	
	if data.Speed > 100 and impactAngle < 85 then
		self:selfDestruct()
	end
end

function ENT:selfDestruct()
	self.HadEnough = true
	
	if self.DontDestroy then return end
	
	-- util.BlastDamage(self, self.Owner, self:GetPos(), self.BlastRadius, self.BlastDamage)
	
	-- local ef = EffectData()
	-- ef:SetOrigin(self:GetPos())
	-- ef:SetMagnitude(1)
	
	-- util.Effect("Explosion", ef)
	
	local expl = ents.Create("env_explosion")
	expl.CW_KK_INS2_inflictor = self
	expl:SetPos(self:GetPos())
	expl:SetOwner(self.Owner or ents.GetByIndex(1))
	expl:Spawn()
	expl:SetKeyValue("iMagnitude", tostring(self.BlastDamage))
	expl:SetKeyValue("iRadiusOverride", tostring(self.BlastRadius))
	expl:Fire("Explode",0,0)
	
	self:Remove()
end

local choppas = {
	npc_helicopter = true,
	npc_combinedropship = true,
	npc_combinegunship = true,
}

function ENT:SearchNDestroy()
	local hit 
	
	for k,v in pairs(ents.GetAll()) do
		if IsValid(v) and v.IsNPC and v:IsNPC() then
			if choppas[v:GetClass()] then
				if v:GetPos():Distance(self:GetPos()) < 400 then
					v:Fire("selfDestruct")
					hit = true
				end
			end
		end
	end
	
	if hit then 
		self:selfDestruct()
	end
end

function ENT:OnTakeDamage(dmg)
	if self.HadEnough then return end
	
	self:selfDestruct()
end
	