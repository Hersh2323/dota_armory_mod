function scale_npc_health(event)
	local ability = event.ability
	local caster = event.caster

	-- current hero dps = dps * difficulty
	-- health = current hero dps * combat time
	local unit_type_multiplier = return_unit_label_multiplier_float(caster:GetUnitLabel() )
	--print("[Debug] unit_type_multiplier: " .. unit_type_multiplier)

	local expected_hero_dps = GLOBAL_VARIABLE_HERO_DPS_PER_LEVEL*c_func_call_combined_difficulty_return_int()
	--print("[ Debug ][ expected_hero_dps: " .. expected_hero_dps .." ]")

	local health_to_be_scaled = expected_hero_dps*GLOBAL_VARIABLE_TOTAL_COMBAT_TIME
	local health_to_be_scaled_to = health_to_be_scaled*GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME
	local health_to_be_scaled_to_after_type_mult = health_to_be_scaled_to*unit_type_multiplier



	-- health stacking modifier >> modifier_npc_scaling_health_stacks_datadriven
	local health_modifier = caster:FindModifierByName("modifier_npc_scaling_health_stacks_datadriven")

	local stacks_we_want = health_to_be_scaled_to_after_type_mult/10
	stacks_we_want = math.ceil(stacks_we_want)
	--print("[ Debug ][ stacks_we_want: " .. stacks_we_want .. " ]")




	if health_modifier then

		local current_stacks = health_modifier:GetStackCount()
		--print("[ Debug ][ current_stacks: " .. current_stacks.. " ]")
		if stacks_we_want == current_stacks then
		else

			health_modifier:SetStackCount(stacks_we_want)
			caster:SetBaseMaxHealth(stacks_we_want*10)

		end
	else

		local health_modifier = ability:ApplyDataDrivenModifier(caster, caster, "modifier_npc_scaling_health_stacks_datadriven", {} ) 
		health_modifier:SetStackCount(stacks_we_want)
		caster:SetBaseMaxHealth(stacks_we_want*10)

	end

end