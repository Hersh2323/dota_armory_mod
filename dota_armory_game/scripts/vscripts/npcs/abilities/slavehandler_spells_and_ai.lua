function detect_allies(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability


	local combat_active = caster:FindModifierByName("modifier_combat_active_datadriven")
	local combat_active_target = target:FindModifierByName("modifier_combat_active_datadriven")
	local cooldown_status_b = ability:IsCooldownReady()
	local cooldowntime = ability:GetCooldown(1)

	if target and combat_active and cooldown_status_b and combat_active_target then

		local caster_unit_name = caster:GetUnitName()
		local target_unit_name = target:GetUnitName()

		if caster_unit_name == target_unit_name then
		else
			ability:ApplyDataDrivenModifier(caster, target, "modifier_slavehandler_inspired_effect_datadriven", {}) 

			StartAnimation(caster, {duration=2.5, activity=ACT_DOTA_ATTACK2, rate=1.0})

			ability:StartCooldown(cooldowntime)

			print("[ DEBUG ][ detect_allies ][ inspire ability cast on nearby allies ]")
		end


	end
end


function remove_buff_on_death(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local modifier = target:FindModifierByNameAndCaster( "modifier_slavehandler_inspired_effect_datadriven", caster)

	if IsValidEntity(caster) and IsValidEntity(target) then
		if modifier then
			target:RemoveModifierByNameAndCaster("modifier_slavehandler_inspired_effect_datadriven", caster) 
		end
	end
end