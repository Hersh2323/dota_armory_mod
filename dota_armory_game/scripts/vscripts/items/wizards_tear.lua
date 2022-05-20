function wizard_tear_damage(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target
	local damage_mult = ability:GetLevelSpecialValueFor("proc_damage_multiplier", ability:GetLevel() )
	local bat = caster:GetBaseAttackTime()

	local total_dmg = damage_mult*bat

	local damageTable = {
		victim = target,
		attacker = caster,
		damage_type = DAMAGE_TYPE_MAGICAL,
		damage = total_dmg
	}

	ApplyDamage(damageTable)

end