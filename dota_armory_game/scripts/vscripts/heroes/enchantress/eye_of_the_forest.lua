function blessing_application(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target


	local additional_duration = ability:GetLevelSpecialValueFor("hot_duration", ability:GetLevel())
	local max_duration = ability:GetLevelSpecialValueFor("max_hot_duration", ability:GetLevel())
	local hot_modifier = target:FindModifierByNameAndCaster("modifier_blessing_of_the_forest_hot_datadriven", caster)

	local is_target_in_combat = IsThisUnitInCombat(target)
	if is_target_in_combat == true then
		StartCombatWithThisUnit(caster)
	else
	end

	if hot_modifier then
		local hot_duration = hot_modifier:GetRemainingTime()
		local hot_duration_increased =  hot_duration + additional_duration

		if hot_duration_increased > max_duration then
			hot_duration_increased = max_duration
			hot_modifier:SetDuration(hot_duration_increased, true)

		else
			hot_modifier:SetDuration(hot_duration_increased, true)

		end
		print("[Debug][ blessing_application() ][ hot_duration: " .. hot_duration_increased)
	else
		ability:ApplyDataDrivenModifier(caster, target, "modifier_blessing_of_the_forest_hot_datadriven", {})
	end
end

function blessing_application_self(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.caster


	local additional_duration = ability:GetLevelSpecialValueFor("hot_duration", ability:GetLevel())
	local max_duration = ability:GetLevelSpecialValueFor("max_hot_duration", ability:GetLevel())
	local hot_modifier = target:FindModifierByNameAndCaster("modifier_blessing_of_the_forest_hot_datadriven", caster)

	local is_target_in_combat = IsThisUnitInCombat(target)
	if is_target_in_combat == true then
		StartCombatWithThisUnit(caster)
	else
	end

	if hot_modifier then
		local hot_duration = hot_modifier:GetRemainingTime()
		local hot_duration_increased =  hot_duration + additional_duration

		if hot_duration_increased > max_duration then
			hot_duration_increased = max_duration
			hot_modifier:SetDuration(hot_duration_increased, true)

		else
			hot_modifier:SetDuration(hot_duration_increased, true)

		end
		print("[Debug][ blessing_application() ][ hot_duration: " .. hot_duration_increased)
	else
		ability:ApplyDataDrivenModifier(caster, target, "modifier_blessing_of_the_forest_hot_datadriven", {})
	end
end

function blessing_heal_tick(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local current_int = caster:GetIntellect()
	local int_multiplier = ability:GetLevelSpecialValueFor("pct_int_to_dmg", ability:GetLevel())
	local int_multiplier_float = int_multiplier/100
	--GameRules:SendCustomMessage("[ Debug ] ability:GetLevel(): " .. ability:GetLevel(), 0, 0)
	--GameRules:SendCustomMessage("[ Debug ] int_multiplier_float: " .. int_multiplier_float, 0, 0)

	
	local heal_value = current_int*int_multiplier_float
	local is_this_a_crit = return_critical_strike_roll_success(caster)

	local is_target_in_combat = IsThisUnitInCombat(target)
	if is_target_in_combat == true then
		--StartCombatWithThisUnit(caster)
	else
	end


	if is_this_a_crit == true then
		local crit_damage = get_crit_damage_float(caster)
		local heal_after_crit = heal_value*crit_damage

		target:Heal(heal_after_crit, caster)


		--GameRules:SendCustomMessage("[ Debug ] blessing_heal_tick(critical): " .. heal_after_crit, 0, 0)
		--GameRules:SendCustomMessage("[ Debug ] ds_damage(get_crit_damage_float): " .. crit_damage, 0, 0)


	else
		target:Heal(heal_value, caster)
		--GameRules:SendCustomMessage("[ Debug ] blessing_heal_tick: " .. heal_value, 0, 0)
	end
end
















function bane_tick_damage(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local current_int = caster:GetIntellect()
	local int_multiplier = ability:GetLevelSpecialValueFor("dot_pct_int_to_dmg", ability:GetLevel())
	local int_multiplier_float = int_multiplier/100
	--GameRules:SendCustomMessage("[ Debug ] ability:GetLevel(): " .. ability:GetLevel(), 0, 0)
	--GameRules:SendCustomMessage("[ Debug ] int_multiplier_float: " .. int_multiplier_float, 0, 0)

	
	local damage_value = current_int*int_multiplier_float
	local is_this_a_crit = return_critical_strike_roll_success(caster)


	if is_this_a_crit == true then
		local crit_damage = get_crit_damage_float(caster)
		local damage_after_crit = damage_value*crit_damage

		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = damage_after_crit
		}

		ApplyDamage(damageTable)

		--GameRules:SendCustomMessage("[ Debug ] bane_tick_damage(critical): " .. damage_after_crit, 0, 0)
		--GameRules:SendCustomMessage("[ Debug ] ds_damage(get_crit_damage_float): " .. crit_damage, 0, 0)


	else
		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = damage_value
		}

		ApplyDamage(damageTable)
		--GameRules:SendCustomMessage("[ Debug ] bane_tick_damage: " .. damage_value, 0, 0)
	end
end
