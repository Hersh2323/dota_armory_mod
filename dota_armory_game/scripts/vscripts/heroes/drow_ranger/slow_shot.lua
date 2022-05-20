function slow_shot_damage(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local crit_success_bool = return_critical_strike_roll_success(caster)



	if crit_success_bool == true then
		local base_damage = custom_base_damage_calculation(caster)
		local base_dmg_multiplier = ability:GetLevelSpecialValueFor("base_damage_weapon_damage", ability:GetLevel() -1 )
		local base_dmg_multiplier_float = base_dmg_multiplier/100
		local damage_value = base_damage*base_dmg_multiplier_float
		local crit_damage = get_crit_damage_float(caster)
		local damage_after_crit = damage_value*crit_damage

		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = damage_after_crit
		}

		ApplyDamage(damageTable)

		--GameRules:SendCustomMessage("[ Debug ] slow_shot_damage(critical): " .. damage_after_crit, 0, 0)
	else
	end

	if crit_success_bool == false then
		local base_damage = custom_base_damage_calculation(caster)
		local base_dmg_multiplier = ability:GetLevelSpecialValueFor("base_damage_weapon_damage", ability:GetLevel() -1 )
		local base_dmg_multiplier_float = base_dmg_multiplier/100
		local damage_value = base_damage*base_dmg_multiplier_float

		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage = damage_value
		}
		
		ApplyDamage(damageTable)

		--GameRules:SendCustomMessage("[ Debug ] slow_shot_damage: " .. damage_value, 0, 0)
	else
	end



end


function spell_cd(event)
	local caster = event.caster
	local ability = event.ability

	local cd_time = caster:GetBaseAttackTime()

	if cd_time then
		--print("[Debug][spell_cd][cd_time: " .. cd_time)
		ability:StartCooldown(cd_time)

		local time_at_cast = GameRules:GetGameTime()
		local time_at_cast_addition = time_at_cast+cd_time
		caster:AttackNoEarlierThan(time_at_cast_addition)
	else
	end


end