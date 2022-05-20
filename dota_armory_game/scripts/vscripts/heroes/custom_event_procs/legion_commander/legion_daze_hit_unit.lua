function legion_commander_daze_hit_unit_event( event )
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(caster) and IsValidEntity(target) and ability then
		local casterHeroName = caster:GetUnitName()
		local abilityName = ability:GetAbilityName()
		--local playerID = caster:GetPlayerID()

		local targetHeroName = target:GetUnitName()
		local abilityName = ability:GetAbilityName()
		--local targetplayerID = target:GetPlayerID()


		-- 2021 07 25 errors were caused by using GetPlayerID(), but this was only used in debug text
		-- print("[EVENT PROCS][ABILITY ABILITY APPLICATION EVENT] [" .. casterHeroName .. "]" .. "[PID: " .. playerID .. " ] Damage proc event via " .. abilityName .. " to target:[ " .. targetHeroName .. " ][ " .. targetplayerID .." ]" )

	else
	end


end
