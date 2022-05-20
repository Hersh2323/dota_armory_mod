function health_per_level(event)
	local ability = event.ability
	local caster = event.ability

end

function dps_per_level(event)
	local ability = event.ability
	local caster = event.caster

	local current_level = caster:GetLevel()
	local dps_per_level = GLOBAL_VARIABLE_HERO_DPS_PER_LEVEL

	-- modifier = modifier_test_scaling_damage_stack_datadriven

    local current_level = caster:GetLevel()
    local dps_per_level = GLOBAL_VARIABLE_HERO_DPS_PER_LEVEL
    local b_a_t = caster:GetBaseAttackTime()
    local current_level_adjusted = current_level - 1

    -- adjust to ability to reenable
    if currently_disabled_ability then

        local dps_scaling_modifier_stack = caster:FindModifierByName("modifier_test_scaling_damage_stack_datadriven")

        local dps_in_stacks = current_level_adjusted * dps_per_level
        local dps_in_stacks_a = dps_in_stacks * b_a_t
        local dps_in_stacks_b = math.ceil(dps_in_stacks_a)

        print("[ Debug ][ level up test stat scaling. Additional DPS: " .. dps_in_stacks .. " ]")
        print("[ Debug ][ Additional dps expressed in base damage: " .. dps_in_stacks_b .. " ]")


        if dps_scaling_modifier_stack then

        	local stack_count = dps_scaling_modifier_stack:GetStackCount()

        	if dps_in_stacks_b == stack_count then
        	else
        		dps_scaling_modifier_stack:SetStackCount(dps_in_stacks_b)
        	end
        else

        	local dps_scaling_modifier_stack = ability:ApplyDataDrivenModifier(caster, caster, "modifier_test_scaling_damage_stack_datadriven", {}) 
        	dps_scaling_modifier_stack:SetStackCount(dps_in_stacks_b)
        end



    end


end