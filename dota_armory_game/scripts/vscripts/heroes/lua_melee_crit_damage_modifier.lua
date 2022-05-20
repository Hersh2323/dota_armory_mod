lua_melee_crit_damage_modifier = class({})

function lua_melee_crit_damage_modifier:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
	}

	return funcs
end

function lua_melee_crit_damage_modifier:GetModifierPreAttack_CriticalStrike()

	local crit_damage = get_crit_damage_float(self:GetParent())
	--print("[Debug][] " .. crit_damage)


	return crit_damage*100
end

function lua_melee_crit_damage_modifier:IsHidden() 
	return true
end