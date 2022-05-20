function proc_buff(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.unit
	local target_hp_pct = target:GetHealthPercent()
	local hp_pct_target = ability:GetLevelSpecialValueFor("proc_health_pct", ability:GetLevel() )

	--print("[Debug][dagger_of_expedience - proc_buff] target_hp_pct, " .. target_hp_pct .. "  hp_pct_target," .. hp_pct_target)

	if target_hp_pct > hp_pct_target then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_dagger_of_expedience_buff_datadriven", {} )
	else
	end
end