function armor_proc_roll(event)
	local caster = event.caster
	local attacker = event.attacker
	local ability = event.ability

	local proc_chance = ability:GetLevelSpecialValueFor("proc_chance", 0)
	local cooldown_duration = ability:GetLevelSpecialValueFor("proc_cooldown", 0)
	local proc_health_percent_window = ability:GetLevelSpecialValueFor("proc_health_percent_window", 0)


	local ability_cooldown = ability:GetCooldownTimeRemaining()

	if ability_cooldown > 0 then
	else
		local caster_current_health_percentage = caster:GetHealthPercent()
		--print("caster_current_health_percentage: " .. caster_current_health_percentage)

		if caster_current_health_percentage <= proc_health_percent_window then

			local roll = RandomInt(0, 100)
			if roll <= proc_chance then
				ability:ApplyDataDrivenModifier(caster, caster, "modifier_lc_d2_green_chest_proc_datadriven", {})
				ability:StartCooldown(cooldown_duration) 
			end
		else
		end
	end
end