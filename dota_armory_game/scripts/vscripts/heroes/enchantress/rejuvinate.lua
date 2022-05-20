function rejuvinate_heal(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	local hot_modifier = target:FindModifierByNameAndCaster("modifier_blessing_of_the_forest_hot_datadriven", caster)

	if hot_modifier then
		local current_int = caster:GetIntellect()
		local int_multiplier = ability:GetLevelSpecialValueFor("pct_int_to_dmg", ability:GetLevel())
		local int_multiplier_float = int_multiplier/100
		--GameRules:SendCustomMessage("[ Debug ] ability:GetLevel(): " .. ability:GetLevel(), 0, 0)
		--GameRules:SendCustomMessage("[ Debug ] int_multiplier_float: " .. int_multiplier_float, 0, 0)

		
		local heal_value = current_int*int_multiplier_float
		local is_this_a_crit = return_critical_strike_roll_success(caster)

		local is_target_in_combat = IsThisUnitInCombat(target)
		if is_target_in_combat == true then
			StartCombatWithThisUnit(caster)
		else
		end


		if is_this_a_crit == true then
			local crit_damage = get_crit_damage_float(caster)
			local heal_after_crit = heal_value*crit_damage

			target:Heal(heal_after_crit, caster)


			--GameRules:SendCustomMessage("[ Debug ] rejuvinate_heal(critical): " .. heal_after_crit, 0, 0)
			--GameRules:SendCustomMessage("[ Debug ] ds_damage(get_crit_damage_float): " .. crit_damage, 0, 0)


		else
			target:Heal(heal_value, caster)
			--GameRules:SendCustomMessage("[ Debug ] rejuvinate_heal: " .. heal_value, 0, 0)
		end
	else
	end



	local yAbility = caster:FindAbilityByName("enchantress_eye_of_the_forest_datadriven")

	if yAbility then

		local additional_duration = yAbility:GetLevelSpecialValueFor("hot_duration", yAbility:GetLevel())
		local max_duration = yAbility:GetLevelSpecialValueFor("max_hot_duration", yAbility:GetLevel())

		if hot_modifier then
			local hot_duration = hot_modifier:GetRemainingTime()
			local hot_duration_increased =  hot_duration + additional_duration

			if hot_duration_increased > max_duration then
				hot_duration_increased = max_duration
				hot_modifier:SetDuration(hot_duration_increased, true)

			else
				hot_modifier:SetDuration(hot_duration_increased, true)

			end
			print("[Debug][ blessing_application() ][ rejuvinate_heal duration increase: " .. hot_duration_increased)
		else
			--yAbility:ApplyDataDrivenModifier(caster, target, "modifier_blessing_of_the_forest_hot_datadriven", {})
		end
	else
	end
end

