

function spawn_entity(thisEntity)
	print("[Debug][spawn_entity][ spawn_entity() ran spawn.lua]")

	if thisEntity then


		--thisEntity:Enable()

		--[[

		--print("[spawn_entity][thisEntity]")
		local ent_name = thisEntity:GetName() print("[Debug][spawn_entity][ thisEntity:GetName(): " .. ent_name)
		local ent_location = thisEntity:GetAbsOrigin()
		local npc_unit_name = "npc_armory_basic_creep_badguys_ranged_datadriven"

		if ent_location then
			print("[Debug][spawn_entity][ ent_location exists ]")
		else
		end


		unit = CreateUnitByName(npc_unit_name, ent_location, true, nil, nil, DOTA_TEAM_NEUTRALS)

		--local spawn = CreateUnitByName("npc_dota_operation_candle_kobold_vermin", ent_location, true, nil, nil, DOTA_TEAM_NEUTRALS)
		]]

	else
	end

end

local spawner = spawn_entity(thisEntity)
