LinkLuaModifier("lua_model_size_gathering_node_herb_modifier_buff", "systems/modifiers/lua_model_size_gathering_node_modifier.lua", LUA_MODIFIER_MOTION_NONE)


function determine_spawn_check_interval(event)
	local caster = event.caster
	local ability = event.ability

	local base_restock_time_min = ability:GetLevelSpecialValueFor("time_till_restock_min", ability:GetLevel() )	
	local base_restock_time_max = ability:GetLevelSpecialValueFor("time_till_restock_max", ability:GetLevel() )	
	local determined_restock_time = RandomInt(base_restock_time_min, base_restock_time_max)

	print("[debug][ gathering_node ][ determine_spawn_check_interval ran ]")

	if determined_restock_time then
		print("[Debug][determine_spawn_check_interval][ Gathering node has attempted to create a node. Restocking in: " .. determined_restock_time)
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_gathering_node_thinker_datadriven", {duration=determined_restock_time})
	else
	end


	--[[
		if GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS then
			GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS = GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS+1 		print("[Debug][gathering_node][GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS: " .. GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS)
		else
			GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS = 1 		print("[Debug][determine_spawn_check_interval][GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS: " .. GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS)
		end

	]]

	
end




function apply_lua_modifiers_relevant_to_node_type(event)


end



function active_node_buff_started( event )
	local caster = event.caster
	local ability = event.ability

	--caster:AddNewModifier(caster, ability, "lua_model_size_gathering_node_herb_modifier_buff", {})

	caster:SetTeam(DOTA_TEAM_GOODGUYS)
end

function active_node_buff_ended( event )
	local caster = event.caster
	local ability = event.ability
	local target = event.target
	--caster:RemoveModifierByName("lua_model_size_gathering_node_herb_modifier_buff")

	caster:SetTeam(DOTA_TEAM_NEUTRALS)

end


function active_node_spawned(event)
	local caster = event.caster
	local ability = event.ability

    GameRules:SendCustomMessage("[Debug][active_node_spawned]", 0, 0)


    ability:ApplyDataDrivenModifier(caster, caster, "modifier_gathering_node_active_datadriven", {ability:GetLevel()})

end



function interact(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	if target then
		--print("[Debug][ Interact ][ Attempted to interact with: " .. target:GetName() )

		if target:GetName() == "herb_node" then
			local active_modifier = target:FindModifierByName("modifier_gathering_node_active_datadriven")
			if active_modifier then
				active_modifier:Destroy()

				local node_ability = target:FindAbilityByName("armory_gathering_node_datadriven")

				local herb_modifier_on_caster = caster:FindModifierByName("modifier_herb_node_gathered_datadriven")
				if herb_modifier_on_caster then herb_modifier_on_caster:Destroy() end

				node_ability:ApplyDataDrivenModifier( target, caster, "modifier_herb_node_gathered_datadriven", {} )
			else
			end
		else
		end

	else
	end
end

