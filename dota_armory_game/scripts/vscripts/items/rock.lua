function eat_rock(event)
	local caster = event.caster
	local ability = event.ability

	local roll = RandomInt(0, 100)
	local death_chance = ability:GetLevelSpecialValueFor("death_chance", ability:GetLevel() )

	if roll <= death_chance then
		GameRules:SendCustomMessage(caster:GetName() .. " ate a rock and was it was almost certainly fatal.", 0, 0)

		local death_damage = ability:GetLevelSpecialValueFor("death_damage", ability:GetLevel() )
		local death_delay = ability:GetLevelSpecialValueFor("death_delay", ability:GetLevel() )


		  Timers:CreateTimer({
		    endTime = death_delay, -- when this timer should first execute, you can omit this if you want it to run first on the next frame
		    callback = function()

				local damageTable = {
					victim = caster,
					attacker = caster,
					damage_type = DAMAGE_TYPE_PHYSICAL,
					damage = death_damage
				}

				ApplyDamage(damageTable)

		      --print ("")
		    end
		  })




	else
		GameRules:SendCustomMessage(caster:GetName() .. " ate a rock.", 0, 0)
	end

	ability:Destroy()
end