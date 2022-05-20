function rabid_cast(event)
	local caster = event.caster
	local ability = event.ability

	local cooldown_status_b = ability:IsCooldownReady()
	local cooldowntime = ability:GetCooldown(1)

	if IsValidEntity(caster) and cooldown_status_b then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_rabid_effect_datadriven", {} ) 
		ability:StartCooldown(cooldowntime)
	end
end

function play_rabid_cast_animation(event)
	local caster = event.caster
	local ability = event.ability

	StartAnimation(caster, {duration=1.0, activity=ACT_DOTA_CAST_ABILITY_1, rate=1.3})
	
end