function channel_win_tp_home(event)
	local caster = event.caster
	local ability = event.ability

	local tp_loc = Entities:FindByName(nil, HOME_TELEPORT_LOCATION_NPC_NAME_STRING)
	if tp_loc then
		local tp_loc_location = tp_loc:GetAbsOrigin()
		local cooldown = ability:GetLevelSpecialValueFor("win_cd_duration", 0)
		FindClearSpaceForUnit(caster, tp_loc_location, false)
		ability:StartCooldown(cooldown)
		caster:Stop()

	else
		print("[ DEBUG ][ TELEPORT ABILITY ] Teleport home location npc could not be found")
	end
end


function interrupt_channel_damage_taken(event)
	local caster = event.caster
	local ability = event.ability


	if caster:IsChanneling() then
		ability:EndChannel(true)
	else

	end

end



function create_portal(event)
	local caster = event.caster
	local ability = event.ability
	local pID = caster:GetPlayerID()

	local fv = caster:GetForwardVector()
	local origin = caster:GetAbsOrigin()
	local distance = ability:GetLevelSpecialValueFor("portal_forward_placement_distance", 0)
	local placement_location = origin + fv * distance


	if ability.player_portal_start then
		ability.player_portal_start = ability.player_portal_start:Destroy()
		ability.player_portal_start = nil
    	ability.player_portal_start = CreateUnitByName("player_created_portal_datadriven", placement_location, true, nil, nil, DOTA_TEAM_GOODGUYS)

    	ability.player_portal_start:SetOwner(caster)
    	print("[Debug][create_portal][SetOwner set to playerID: " .. pID)

		GameRules:SendCustomMessage(caster:GetName() .. " has created a portal for all to use.", 0, 0)


	else
    	ability.player_portal_start = CreateUnitByName("player_created_portal_datadriven", placement_location, true, nil, nil, DOTA_TEAM_GOODGUYS)

    	ability.player_portal_start:SetOwner(caster)
    	print("[Debug][create_portal][SetOwner set to playerID: " .. pID)

		GameRules:SendCustomMessage(caster:GetName() .. " has created a portal for all to use.", 0, 0)

	end

end



function create_home_portal(event)
	local caster = event.caster
	local ability = event.ability
	local pID = caster:GetPlayerID()

	if ability.player_portal_home then
	else

		Timers:CreateTimer({
		endTime = 1, -- when this timer should first execute, you can omit this if you want it to run first on the next frame
		callback = function()

	    	ability.player_portal_home = CreateUnitByName("player_created_portal_datadriven", caster:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS)

	    	ability.player_portal_home:SetOwner(caster)
	    	print("[Debug][create_home_portal][SetOwner set to playerID: " .. pID)

		end
		})


	end

end

function apply_teleport_modifier(event)
	local caster = event.caster
	local target = event.target
	local portal_owner = caster:GetOwner()
	local ability = portal_owner:FindAbilityByName("player_teleport_datadriven")

	print("[debug][apply_teleport_modifier] modifier_source name: " .. portal_owner:GetName())

	if ability then
		ability:ApplyDataDrivenModifier(portal_owner, target, "modifier_player_teleport_active_datadriven", {})
	else
	end


end


function teleport(event)
	print("[Debug][teleport][cast]")
	local target = event.target
	local nearby_teleport_aura = target:FindModifierByName("modifier_player_teleport_pending_datadriven")
	local nearby_teleport_unit = nearby_teleport_aura:GetCaster()	print("[Debug][nearby_teleport_unit: " .. nearby_teleport_unit:GetName() )
	local portal_owner = nearby_teleport_unit:GetOwner()	print("[Debug][portal_owner: " .. portal_owner:GetName() )

	local ability = portal_owner:FindAbilityByName("player_teleport_datadriven")

	 if ability.player_portal_home then
		if ability.player_portal_start == nearby_teleport_unit then
			target:Stop()
			--GameRules:SendCustomMessage("[Debug][teleport][ ability.player_portal_start detected]", 0, 0)
			GameRules:SendCustomMessage(target:GetName() .. " has teleported home.", 0, 0)

			FindClearSpaceForUnit(target, ability.player_portal_home:GetAbsOrigin(), false)	

			PlayerResource:SetCameraTarget(target:GetPlayerID(), target)

			Timers:CreateTimer(0.1, function()
				PlayerResource:SetCameraTarget(target:GetPlayerID(), nil)
				return
			end
			)


		else
		end
	 else
	 end



	 if ability.player_portal_start then
		if ability.player_portal_home == nearby_teleport_unit then
			target:Stop()
			--GameRules:SendCustomMessage("[Debug][teleport][ ability.player_portal_home detected]", 0, 0)
			GameRules:SendCustomMessage(target:GetName() .. " has teleported back.", 0, 0)

			FindClearSpaceForUnit(target, ability.player_portal_start:GetAbsOrigin(), false)	


			PlayerResource:SetCameraTarget(target:GetPlayerID(), target)

			Timers:CreateTimer(0.1, function()
				PlayerResource:SetCameraTarget(target:GetPlayerID(), nil)
				return
			end
			)



		else
		end

	 else
	 end



end