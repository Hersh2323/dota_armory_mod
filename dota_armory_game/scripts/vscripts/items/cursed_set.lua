function weaponProc(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local proc_max_health_pct = ability:GetLevelSpecialValueFor("proc_max_health_pct", 0)
	local proc_max_health_pct_as_float = proc_max_health_pct/100
	local proc_delay = ability:GetLevelSpecialValueFor("proc_damage_delay", 0)

	local caster_max_health = caster:GetMaxHealth()
	local health_to_deal_as_damage = caster_max_health*proc_max_health_pct_as_float


	Timers:CreateTimer(proc_delay, function()

		if IsValidEntity(caster) and IsValidEntity(target) then

			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = DAMAGE_TYPE_MAGICAL,
				damage = health_to_deal_as_damage
			}

			ApplyDamage(damageTable)
				
			--GameRules:SendCustomMessage("[ Debug ][ cursed_set proc target damage: " .. health_to_deal_as_damage, 0, 0)



			local damageTable_c = {
				victim = caster,
				attacker = caster,
				damage_type = DAMAGE_TYPE_MAGICAL,
				damage = health_to_deal_as_damage
			}
			
			ApplyDamage(damageTable_c)

			--GameRules:SendCustomMessage("[ Debug ][ cursed_set proc caster damage: " .. health_to_deal_as_damage, 0, 0)


		else
		end

		return
	end
	)




end



function proc_helm(event)
	local caster = event.caster
	local ability = event.ability

	local dmg_min = ability:GetLevelSpecialValueFor("proc_damage_range_min", 0)
	local dmg_max = ability:GetLevelSpecialValueFor("proc_damage_range_max", 0)
	local dmg_roll = RandomInt(dmg_min, dmg_max)

	local damageTable = {
		victim = caster,
		attacker = caster,
		damage_type = DAMAGE_TYPE_MAGICAL,
		damage = dmg_roll
	}

	ApplyDamage(damageTable)

end


