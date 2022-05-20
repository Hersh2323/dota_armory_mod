LinkLuaModifier("lua_melee_crit_damage_modifier", "heroes/lua_melee_crit_damage_modifier.lua", LUA_MODIFIER_MOTION_NONE)



function rollCritChance(event)
	local caster = event.caster
	local ability = event.ability

	caster:RemoveModifierByName("lua_melee_crit_damage_modifier")

	local is_this_attack_crit = return_critical_strike_roll_success(caster)

	if is_this_attack_crit == true then
		caster:AddNewModifier(caster, ability, "lua_melee_crit_damage_modifier", {})

	else
	end

end