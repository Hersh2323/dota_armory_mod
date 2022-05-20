function fireball_damage(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local current_int = caster:GetIntellect()
	local int_multiplier = ability:GetLevelSpecialValueFor("pct_int_to_dmg", ability:GetLevel())
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

		--GameRules:SendCustomMessage("[ Debug ] fireball_damage(critical): " .. damage_after_crit, 0, 0)
		--GameRules:SendCustomMessage("[ Debug ] ds_damage(get_crit_damage_float): " .. crit_damage, 0, 0)


	else
		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = damage_value
		}

		ApplyDamage(damageTable)
		--GameRules:SendCustomMessage("[ Debug ] fireball_damage: " .. damage_value, 0, 0)
	end
end