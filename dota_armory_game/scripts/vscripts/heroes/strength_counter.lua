function establish_stack_conditional(event)
	local caster = event.caster
	local ability = event.ability

	local modifier_for_stack = caster:FindModifierByName("modifier_strength_gain_counter_stacks_datadriven")
	if modifier_for_stack then
	else
		local modifier_for_stack = ability:ApplyDataDrivenModifier(caster, caster, "modifier_strength_gain_counter_stacks_datadriven", {} )
	end


	local int_modifier_for_stack = caster:FindModifierByName("modifier_intellect_gain_counter_stacks_datadriven")
	if int_modifier_for_stack then
	else
		local int_modifier_for_stack = ability:ApplyDataDrivenModifier(caster, caster, "modifier_intellect_gain_counter_stacks_datadriven", {} )
	end


	local primary_attr = caster:GetPrimaryAttribute()
	if primary_attr == DOTA_ATTRIBUTE_AGILITY then

		local agi_modifier_for_stack = caster:FindModifierByName("modifier_agility_gain_stacks_datadriven")
		if agi_modifier_for_stack then
		else
			local agi_modifier_for_stack = ability:ApplyDataDrivenModifier(caster, caster, "modifier_agility_gain_stacks_datadriven", {} )
		end

	else
	end








end


function update_stacks(event)
	local caster = event.caster
	local ability = event.ability
	local current_str_value = caster:GetStrength()
	local current_int_value = caster:GetIntellect()
	local current_agi_value = caster:GetAgility()
	local modifier_for_stack = caster:FindModifierByName("modifier_strength_gain_counter_stacks_datadriven")

	if modifier_for_stack then
		caster:SetModifierStackCount("modifier_strength_gain_counter_stacks_datadriven", caster, current_str_value)
	else
	end

	local int_modifier_for_stack = caster:FindModifierByName("modifier_intellect_gain_counter_stacks_datadriven")

	if int_modifier_for_stack then
		caster:SetModifierStackCount("modifier_intellect_gain_counter_stacks_datadriven", caster, current_int_value)
	else
	end



	local agi_modifier_for_stack = caster:FindModifierByName("modifier_agility_gain_stacks_datadriven")
	if agi_modifier_for_stack then
		if caster:IsRangedAttacker() then
			local dps_to_base_dmg = 2.2
			local desired_based_damage = current_agi_value*dps_to_base_dmg

			local desired_based_damage = current_agi_value*dps_to_base_dmg
			caster:SetModifierStackCount("modifier_agility_gain_stacks_datadriven", caster, desired_based_damage)

		else
			local dps_to_base_dmg = 1.0
			local desired_based_damage = current_agi_value*dps_to_base_dmg

			local desired_based_damage = current_agi_value*dps_to_base_dmg
			caster:SetModifierStackCount("modifier_agility_gain_stacks_datadriven", caster, desired_based_damage)
		end
	else
	end
end