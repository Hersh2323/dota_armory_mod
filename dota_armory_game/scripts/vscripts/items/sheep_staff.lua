LinkLuaModifier("modifier_sheep_lua", "items/modifiers/modifier_sheep_lua.lua", LUA_MODIFIER_MOTION_NONE)



function sheep_staff_buff_started( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local target_unit_label = target:GetUnitLabel()

	if target_unit_label == "GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_ELITE" then
	else
		if target_unit_label == "GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_BOSS" then
		else
			target:AddNewModifier(caster, ability, "modifier_sheep_lua", {})


			if IsThisUnitInCombat(target) then
				StartCombatWithThisUnit(caster)
			else
			end
		end
	end
end

function sheep_staff_buff_ended( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target
	target:RemoveModifierByName("modifier_sheep_lua")

end



