LinkLuaModifier( "lua_giants_toe_buff" , "items/modifiers/model_size_modifier.lua" , LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "lua_fleas_knees_buff" , "items/modifiers/model_size_modifier.lua" , LUA_MODIFIER_MOTION_NONE )

function toe_equipped(event)
	local caster = event.caster
	local ability = event.ability

    caster:AddNewModifier(caster, ability, "lua_giants_toe_buff", {})

end

function toe_check(event)
	local caster = event.caster
	local ability = event.ability

    caster:AddNewModifier(caster, ability, "lua_giants_toe_buff", {})
end

function toe_unequipped(event)
	local caster = event.caster
	local ability = event.ability

	local modifier_to_remove = caster:FindModifierByNameAndCaster("lua_giants_toe_buff", caster)
	if modifier_to_remove then
		modifier_to_remove:Destroy()
	else
	end
end



function flea_equipped(event)
	local caster = event.caster
	local ability = event.ability

    caster:AddNewModifier(caster, ability, "lua_fleas_knees_buff", {})

end

function flea_check(event)
	local caster = event.caster
	local ability = event.ability

    caster:AddNewModifier(caster, ability, "lua_fleas_knees_buff", {})
end

function flea_unequipped(event)
	local caster = event.caster
	local ability = event.ability

	local modifier_to_remove = caster:FindModifierByNameAndCaster("lua_fleas_knees_buff", caster)
	if modifier_to_remove then
		modifier_to_remove:Destroy()
	else
	end
end