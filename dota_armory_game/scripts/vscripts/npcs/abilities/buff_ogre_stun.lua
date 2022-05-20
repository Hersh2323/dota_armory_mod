function stun_check_and_application(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local cooldown_time_kv = ability:GetCooldown(1)
	--print("[][ CD ][" .. cooldown_time_kv .. " ]")
	local cooldown_time_remaining = ability:GetCooldownTimeRemaining()

	if cooldown_time_remaining > 0 then

	else
		ability:StartCooldown(cooldown_time_kv)
		target:RemoveModifierByName("modifier_crit_stun_effect_datadriven")
		ability:ApplyDataDrivenModifier(caster, target, "modifier_crit_stun_effect_datadriven", {} )



	end
end