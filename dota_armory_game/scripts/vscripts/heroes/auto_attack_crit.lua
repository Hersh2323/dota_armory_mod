LinkLuaModifier("lua_melee_crit_damage_modifier", "heroes/lua_melee_crit_damage_modifier.lua", LUA_MODIFIER_MOTION_NONE)


function apply_this_modifier(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	target:AddNewModifier(caster, ability, "lua_melee_crit_damage_modifier", {})


end