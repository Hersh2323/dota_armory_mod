-- This function will be called at start of the game, but also whenever a player adjusts the difficulty through a unit interaction.
function spawnInNpcs()

	--[[
	GameRules.totalNpcsAvaibleQuest = SpawnEntityFromTableSynchronous( "quest", { name = "totalNpcsAvaibleQuest", title = "#totalNpcsAvaibleQuest" } )

	GameRules.totalNpcsAvaibleQuest.totalNpcsAlive = 0
	GameRules.totalNpcsAvaibleQuest.totalNpcsSpawned = 0


	GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
	        name = "QuestName",
	        title = "#QuestKill"
	    })
	GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
	    show_progress_bar = true,
	    progress_bar_hue_shift = -119
	} )
	GameRules.Quest.UnitsKilled = 0
	GameRules.Quest.KillLimit = 0
	GameRules.Quest:AddSubquest( GameRules.subQuest )

	-- text on the quest timer at start
	GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
	GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

	-- value on the bar
	GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
	GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )
	]]


	if GameRules.DifficultyLevel == nil then
		GameRules.DifficultyLevel = 1
	else
	end

	GameRules.NPCList = {}
	spawn_skeleton_one_one()
	spawn_skeleton_one_two()
	spawn_skeleton_one_three()
	spawn_skeleton_one_four()
	spawn_skeleton_one_five()
	spawn_skeleton_one_six()
	spawn_skeleton_one_seven()
	spawn_skeleton_one_eight()
	spawn_skeleton_one_nine()
	spawn_skeleton_one_ten()


	Timers:CreateTimer(0, function()

		spawn_skeleton_one_one()
		spawn_skeleton_one_two()
		spawn_skeleton_one_three()
		spawn_skeleton_one_four()
		spawn_skeleton_one_five()
		spawn_skeleton_one_six()
		spawn_skeleton_one_seven()
		spawn_skeleton_one_eight()
		spawn_skeleton_one_nine()
		spawn_skeleton_one_ten()

		return 90
	end)

end


function custom_function_on_GLOBAL_VARIABLE_CURRENT_HERO_LEVEL_increase()
	print("custom_function_on_GLOBAL_VARIABLE_CURRENT_HERO_LEVEL_increase() has executed" )
	local npc_to_adjust_global_variable = Entities:FindAllByClassname("npc_dota_creep_neutral")
	custom_function_adjust_npc_stats(npc_to_adjust_global_variable)
end


function custom_function_adjust_npc_stats(npc_to_adjust_global_variable)
	--print(" custom_function_adjust_npc_stats() has executed" )

	local npc_to_adjust = npc_to_adjust_global_variable

	if IsValidEntity(npc_to_adjust) and 
		GLOBAL_VARIABLE_CURRENT_HERO_LEVEL and
		GLOBAL_VARIABLE_ADDITION_DIFFICULTY_HERO_LEVEL and
		GLOBAL_VARIABLE_ADDITIONAL_HEALTH_PER_LEVEL and
		GLOBAL_VARIABLE_BASE_HEALTH and
		GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_MINION and
		GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD and
		GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_ELITE and 
		GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_BOSS then

	    for abilitySlot=0,17 do
	        local ability = npc_to_adjust:GetAbilityByIndex(abilitySlot)

	        if ability then
	            ability:SetLevel(1)
	        end
	    end


		--print("custom_function_adjust_npc_stats has ran")

	else
		--print("custom_function_adjust_npc_stats has ran, but some global variables have passed boolean false i.e. nil")
	end
end


function custom_function_modify_health_and_damage(event)
	local caster = event.caster
	local ability = event.ability

	if IsValidEntity(caster) and 
	GLOBAL_VARIABLE_CURRENT_HERO_LEVEL and
	GLOBAL_VARIABLE_ADDITION_DIFFICULTY_HERO_LEVEL and
	GLOBAL_VARIABLE_ADDITIONAL_HEALTH_PER_LEVEL and
	GLOBAL_VARIABLE_BASE_HEALTH and
	GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_MINION and
	GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD and
	GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_ELITE and 
	GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_BOSS then

		print("GLOBAL_VARIABLE_CURRENT_HERO_LEVEL: " .. GLOBAL_VARIABLE_CURRENT_HERO_LEVEL)
		print("GLOBAL_VARIABLE_ADDITION_DIFFICULTY_HERO_LEVEL: " .. GLOBAL_VARIABLE_ADDITION_DIFFICULTY_HERO_LEVEL)
		print("GLOBAL_VARIABLE_ADDITIONAL_HEALTH_PER_LEVEL: " .. GLOBAL_VARIABLE_ADDITIONAL_HEALTH_PER_LEVEL)
		print("GLOBAL_VARIABLE_BASE_HEALTH: " .. GLOBAL_VARIABLE_BASE_HEALTH)
		print("GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_MINION: " .. GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_MINION)
		print("GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD: " .. GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD)
		print("GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_ELITE: " .. GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_ELITE)
		print("GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_BOSS: " .. GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_BOSS)

		local difficulty_scaled_level_combined = GLOBAL_VARIABLE_CURRENT_HERO_LEVEL + GLOBAL_VARIABLE_ADDITION_DIFFICULTY_HERO_LEVEL

		local health_to_be_adjusted = difficulty_scaled_level_combined*GLOBAL_VARIABLE_ADDITIONAL_HEALTH_PER_LEVEL   

		local health_to_be_adjusted_to = GLOBAL_VARIABLE_BASE_HEALTH+health_to_be_adjusted*GLOBAL_VARIABLE_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD
		print("Health to be adjusted to: " .. health_to_be_adjusted_to)

		local caster_max_health = caster:GetMaxHealth()
		local caster_current_health = caster:GetHealth()

		local health_percentage_in_float = caster_current_health/caster_max_health
		--print("health_percentage_in_float: " .. health_percentage_in_float)
		local health_value_adjusted_to_percentage = health_to_be_adjusted_to*health_percentage_in_float

		caster:SetBaseMaxHealth(health_to_be_adjusted_to)
		--caster:SetHealth(health_value_adjusted_to_percentage)


		local caster_base_attack_time = caster:GetBaseAttackTime()
		local current_dps = difficulty_scaled_level_combined*GLOBAL_VARIABLE_CREEP_DPS_PER_LEVEL
		local caster_base_damage_to_set = caster_base_attack_time*current_dps
		caster:SetBaseDamageMax( caster_base_damage_to_set )
		caster:SetBaseDamageMin( caster_base_damage_to_set )

	else
		print("custom_function_modify_health_and_damage has failed")
	end
end


function spawn_skeleton_one_one()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_one")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_one ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_one ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_one)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_one ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_one = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_one)
	end

end

function spawn_skeleton_one_two()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_two")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_two
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_two ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_two ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_two)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_two ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_two = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_two)
	end

end

function spawn_skeleton_one_three()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_three")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_three
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_three ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_three ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_three)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_three ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_three = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_three)
	end

end

function spawn_skeleton_one_four()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_four")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_four
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_four ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_four ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_four)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_four ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_four = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_four)
	end

end

function spawn_skeleton_one_five()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_five")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_five
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_five ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_five ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_five)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_five ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_five = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_five)
	end

end

function spawn_skeleton_one_six()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_six")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_six
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_six ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_six ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_six)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_six ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_six = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_six)
	end

end

function spawn_skeleton_one_seven()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_seven")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_seven
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_seven ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_seven ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_seven)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_seven ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_seven = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_seven)
	end

end

function spawn_skeleton_one_eight()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_eight")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_eight
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_eight ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_eight ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_eight)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_eight ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_eight = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_eight)
	end

end

function spawn_skeleton_one_nine()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_nine")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_nine
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_nine ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_nine ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_nine)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_nine ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_nine = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_nine)
	end

end

function spawn_skeleton_one_ten()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_skeleton_one_ten")
	local npc_unit_name = "npc_armory_skeleton_one"
	--[[
		global var name = GameRules.NPCList.npc_armory_skeleton_one_ten
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_ten ) then
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_ten ) Passed True")
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_ten)

	else
		print("IsValidEntity( GameRules.NPCList.npc_armory_skeleton_one_ten ) Passed False")

		GameRules.NPCList.npc_armory_skeleton_one_ten = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		custom_function_adjust_npc_stats(GameRules.NPCList.npc_armory_skeleton_one_ten)
	end

end









--
-- Spawnlist for operation candle
--

function spawn_lesser_wolf_one()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_one")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_one ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_one ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_one ) Passed False")

		GameRules.NPCList.lesser_wolf_one = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_one:SetOwner(spawn_location_ent)
		--print(GameRules.NPCList.lesser_wolf_one:GetOwner())
	end

end

function spawn_lesser_wolf_two()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_two")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_two
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_two ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_two ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_two ) Passed False")

		GameRules.NPCList.lesser_wolf_two = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_two:SetOwner(spawn_location_ent)
	end

end

function spawn_lesser_wolf_three()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_three")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_three
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_three ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_three ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_three ) Passed False")

		GameRules.NPCList.lesser_wolf_three = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_three:SetOwner(spawn_location_ent)
	end

end

function spawn_lesser_wolf_four()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_four")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_four
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_four ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_four ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_four ) Passed False")

		GameRules.NPCList.lesser_wolf_four = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_four:SetOwner(spawn_location_ent)
	end

end


function spawn_lesser_wolf_five()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_five")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_five
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_five ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_five ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_five ) Passed False")

		GameRules.NPCList.lesser_wolf_five = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_five:SetOwner(spawn_location_ent)
	end

end

function spawn_lesser_wolf_six()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_six")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_six
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_six ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_six ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_six ) Passed False")

		GameRules.NPCList.lesser_wolf_six = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_six:SetOwner(spawn_location_ent)
	end

end

function spawn_lesser_wolf_seven()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_seven")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_seven
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_seven ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_seven ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_seven ) Passed False")

		GameRules.NPCList.lesser_wolf_seven = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_seven:SetOwner(spawn_location_ent)
	end

end


function spawn_lesser_wolf_eight()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_eight")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_eight
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_eight ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_eight ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_eight ) Passed False")

		GameRules.NPCList.lesser_wolf_eight = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_eight:SetOwner(spawn_location_ent)
	end

end

function spawn_lesser_wolf_nine()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_nine")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_nine
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_nine ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_nine ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_nine ) Passed False")

		GameRules.NPCList.lesser_wolf_nine = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_nine:SetOwner(spawn_location_ent)
	end

end

function spawn_lesser_wolf_ten()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_ten")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_ten
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_ten ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_ten ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_ten ) Passed False")

		GameRules.NPCList.lesser_wolf_ten = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_ten:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_eleven()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_eleven")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_eleven
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_eleven ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_eleven ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_eleven ) Passed False")

		GameRules.NPCList.lesser_wolf_eleven = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_eleven:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_twelve()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twelve")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twelve
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twelve ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twelve ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twelve ) Passed False")

		GameRules.NPCList.lesser_wolf_twelve = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twelve:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_thirteen()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_thirteen")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_thirteen
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_thirteen ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirteen ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirteen ) Passed False")

		GameRules.NPCList.lesser_wolf_thirteen = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_thirteen:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_fourteen()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_fourteen")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_fourteen
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_fourteen ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_fourteen ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_fourteen ) Passed False")

		GameRules.NPCList.lesser_wolf_fourteen = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_fourteen:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_fifteen()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_fifteen")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_fifteen
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_fifteen ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_fifteen ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_fifteen ) Passed False")

		GameRules.NPCList.lesser_wolf_fifteen = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_fifteen:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_sixteen()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_sixteen")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_sixteen
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_sixteen ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_sixteen ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_sixteen ) Passed False")

		GameRules.NPCList.lesser_wolf_sixteen = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_sixteen:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_seventeen()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_seventeen")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_seventeen
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_seventeen ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_seventeen ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_seventeen ) Passed False")

		GameRules.NPCList.lesser_wolf_seventeen = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_seventeen:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_eighteen()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_eighteen")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_eighteen
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_eighteen ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_eighteen ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_eighteen ) Passed False")

		GameRules.NPCList.lesser_wolf_eighteen = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_eighteen:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_nineteen()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_nineteen")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_nineteen
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_nineteen ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_nineteen ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_nineteen ) Passed False")

		GameRules.NPCList.lesser_wolf_nineteen = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_nineteen:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_twenty()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twenty")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twenty
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twenty ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twenty ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twenty ) Passed False")

		GameRules.NPCList.lesser_wolf_twenty = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twenty:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_twentyone()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentyone")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentyone
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentyone ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyone ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyone ) Passed False")

		GameRules.NPCList.lesser_wolf_twentyone = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentyone:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_twentytwo()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentytwo")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentytwo
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentytwo ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentytwo ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentytwo ) Passed False")

		GameRules.NPCList.lesser_wolf_twentytwo = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentytwo:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_twentythree()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentythree")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentythree
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentythree ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentythree ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentythree ) Passed False")

		GameRules.NPCList.lesser_wolf_twentythree = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentythree:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_twentyfour()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentyfour")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentyfour
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentyfour ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyfour ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyfour ) Passed False")

		GameRules.NPCList.lesser_wolf_twentyfour = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentyfour:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_twentyfive()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentyfive")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentyfive
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentyfive ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyfive ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyfive ) Passed False")

		GameRules.NPCList.lesser_wolf_twentyfive = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentyfive:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_twentysix()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentysix")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentysix
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentysix ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentysix ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentysix ) Passed False")

		GameRules.NPCList.lesser_wolf_twentysix = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentysix:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_twentyseven()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentyseven")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentyseven
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentyseven ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyseven ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyseven ) Passed False")

		GameRules.NPCList.lesser_wolf_twentyseven = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentyseven:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_twentyeight()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentyeight")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentyeight
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentyeight ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyeight ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentyeight ) Passed False")

		GameRules.NPCList.lesser_wolf_twentyeight = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentyeight:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_twentynine()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_twentynine")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_twentynine
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_twentynine ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentynine ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_twentynine ) Passed False")

		GameRules.NPCList.lesser_wolf_twentynine = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_twentynine:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_thirty()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_thirty")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_thirty
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_thirty ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirty ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirty ) Passed False")

		GameRules.NPCList.lesser_wolf_thirty = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_thirty:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_thirtyone()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_thirtyone")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_thirtyone
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyone ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyone ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyone ) Passed False")

		GameRules.NPCList.lesser_wolf_thirtyone = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_thirtyone:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_thirtytwo()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_thirtytwo")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_thirtytwo
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_thirtytwo ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtytwo ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtytwo ) Passed False")

		GameRules.NPCList.lesser_wolf_thirtytwo = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_thirtytwo:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_thirtythree()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_thirtythree")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_thirtythree
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_thirtythree ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtythree ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtythree ) Passed False")

		GameRules.NPCList.lesser_wolf_thirtythree = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_thirtythree:SetOwner(spawn_location_ent)
	end
end


function spawn_lesser_wolf_thirtyfour()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_thirtyfour")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_thirtyfour
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyfour ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyfour ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyfour ) Passed False")

		GameRules.NPCList.lesser_wolf_thirtyfour = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_thirtyfour:SetOwner(spawn_location_ent)
	end
end

function spawn_lesser_wolf_thirtyfive()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_lesser_wolf_thirtyfive")
	local npc_unit_name = "npc_dota_operation_candle_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_thirtyfive
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyfive ) then
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyfive ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.lesser_wolf_thirtyfive ) Passed False")

		GameRules.NPCList.lesser_wolf_thirtyfive = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.lesser_wolf_thirtyfive:SetOwner(spawn_location_ent)
	end
end


function spawn_kobold_vermin_1()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_1")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_1 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_1 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_1 ) Passed False")

		GameRules.NPCList.kobold_vermin_1 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_1:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_2()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_2")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_2 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_2 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_2 ) Passed False")

		GameRules.NPCList.kobold_vermin_2 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_2:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_3()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_3")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_3 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_3 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_3 ) Passed False")

		GameRules.NPCList.kobold_vermin_3 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_3:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_4()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_4")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_4 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_4 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_4 ) Passed False")

		GameRules.NPCList.kobold_vermin_4 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_4:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_5()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_5")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_5 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_5 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_5 ) Passed False")

		GameRules.NPCList.kobold_vermin_5 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_5:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_6()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_6")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_6 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_6 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_6 ) Passed False")

		GameRules.NPCList.kobold_vermin_6 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_6:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_7()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_7")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_7 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_7 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_7 ) Passed False")

		GameRules.NPCList.kobold_vermin_7 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_7:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_8()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_8")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_8 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_8 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_8 ) Passed False")

		GameRules.NPCList.kobold_vermin_8 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_8:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_9()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_9")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_9 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_9 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_9 ) Passed False")

		GameRules.NPCList.kobold_vermin_9 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_9:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_10")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_10 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_10 ) Passed False")

		GameRules.NPCList.kobold_vermin_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_10:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_11()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_11")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_11 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_11 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_11 ) Passed False")

		GameRules.NPCList.kobold_vermin_11 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_11:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_12()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_12")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_12 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_12 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_12 ) Passed False")

		GameRules.NPCList.kobold_vermin_12 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_12:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_13()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_13")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_13 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_13 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_13 ) Passed False")

		GameRules.NPCList.kobold_vermin_13 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_13:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_14()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_14")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_14 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_14 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_14 ) Passed False")

		GameRules.NPCList.kobold_vermin_14 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_14:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_15()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_15")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_15 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_15 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_15 ) Passed False")

		GameRules.NPCList.kobold_vermin_15 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_15:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_16()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_16")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_16 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_16 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_16 ) Passed False")

		GameRules.NPCList.kobold_vermin_16 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_16:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_17()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_17")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_17 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_17 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_17 ) Passed False")

		GameRules.NPCList.kobold_vermin_17 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_17:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_18()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_18")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_18 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_18 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_18 ) Passed False")

		GameRules.NPCList.kobold_vermin_18 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_18:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_19()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_19")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_19 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_19 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_19 ) Passed False")

		GameRules.NPCList.kobold_vermin_19 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_19:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_20()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_20")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_20 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_20 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_20 ) Passed False")

		GameRules.NPCList.kobold_vermin_20 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_20:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_21()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_21")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_21 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_21 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_21 ) Passed False")

		GameRules.NPCList.kobold_vermin_21 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_21:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_22()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_22")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_22 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_22 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_22 ) Passed False")

		GameRules.NPCList.kobold_vermin_22 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_22:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_23()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_23")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_23 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_23 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_23 ) Passed False")

		GameRules.NPCList.kobold_vermin_23 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_23:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_24()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_24")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_24 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_24 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_24 ) Passed False")

		GameRules.NPCList.kobold_vermin_24 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_24:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_vermin_25()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_25")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_25 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_25 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_25 ) Passed False")

		GameRules.NPCList.kobold_vermin_25 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_25:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_vermin_26()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_26")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_26 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_26 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_26 ) Passed False")

		GameRules.NPCList.kobold_vermin_26 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_26:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_27()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_27")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_27 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_27 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_27 ) Passed False")

		GameRules.NPCList.kobold_vermin_27 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_27:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_28()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_28")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_28 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_28 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_28 ) Passed False")

		GameRules.NPCList.kobold_vermin_28 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_28:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_29()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_29")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_29 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_29 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_29 ) Passed False")

		GameRules.NPCList.kobold_vermin_29 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_29:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_vermin_30()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_vermin_30")
	local npc_unit_name = "npc_dota_operation_candle_kobold_vermin"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_vermin_30 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_30 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_vermin_30 ) Passed False")

		GameRules.NPCList.kobold_vermin_30 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_vermin_30:SetOwner(spawn_location_ent)
	end

end





function spawn_kobold_worker_1()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_1")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_1 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_1 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_1 ) Passed False")

		GameRules.NPCList.kobold_worker_1 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_1:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_2()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_2")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_2 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_2 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_2 ) Passed False")

		GameRules.NPCList.kobold_worker_2 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_2:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_3()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_3")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_3 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_3 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_3 ) Passed False")

		GameRules.NPCList.kobold_worker_3 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_3:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_4()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_4")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_4 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_4 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_4 ) Passed False")

		GameRules.NPCList.kobold_worker_4 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_4:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_5()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_5")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_5 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_5 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_5 ) Passed False")

		GameRules.NPCList.kobold_worker_5 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_5:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_6()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_6")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_6 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_6 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_6 ) Passed False")

		GameRules.NPCList.kobold_worker_6 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_6:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_7()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_7")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_7 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_7 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_7 ) Passed False")

		GameRules.NPCList.kobold_worker_7 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_7:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_8()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_8")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_8 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_8 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_8 ) Passed False")

		GameRules.NPCList.kobold_worker_8 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_8:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_9()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_9")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_9 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_9 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_9 ) Passed False")

		GameRules.NPCList.kobold_worker_9 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_9:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_10")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_10 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_10 ) Passed False")

		GameRules.NPCList.kobold_worker_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_10:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_11()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_11")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_11 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_11 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_11 ) Passed False")

		GameRules.NPCList.kobold_worker_11 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_11:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_12()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_12")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_12 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_12 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_12 ) Passed False")

		GameRules.NPCList.kobold_worker_12 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_12:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_13()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_13")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_13 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_13 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_13 ) Passed False")

		GameRules.NPCList.kobold_worker_13 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_13:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_14()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_14")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_14 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_14 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_14 ) Passed False")

		GameRules.NPCList.kobold_worker_14 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_14:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_15()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_15")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_15 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_15 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_15 ) Passed False")

		GameRules.NPCList.kobold_worker_15 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_15:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_16()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_16")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_16 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_16 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_16 ) Passed False")

		GameRules.NPCList.kobold_worker_16 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_16:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_17()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_17")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_17 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_17 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_17 ) Passed False")

		GameRules.NPCList.kobold_worker_17 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_17:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_18()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_18")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_18 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_18 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_18 ) Passed False")

		GameRules.NPCList.kobold_worker_18 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_18:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_19()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_19")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_19 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_19 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_19 ) Passed False")

		GameRules.NPCList.kobold_worker_19 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_19:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_worker_20()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_worker_20")
	local npc_unit_name = "npc_dota_operation_candle_kobold_worker"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_worker_20 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_worker_20 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_worker_20 ) Passed False")

		GameRules.NPCList.kobold_worker_20 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_worker_20:SetOwner(spawn_location_ent)
	end

end


function spawn_kobold_laborer_1()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_1")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_1 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_1 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_1 ) Passed False")

		GameRules.NPCList.kobold_laborer_1 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_1:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_laborer_1 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_laborer_1 did not create unit")
		end
	end

end


function spawn_kobold_laborer_2()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_2")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_2 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_2 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_2 ) Passed False")

		GameRules.NPCList.kobold_laborer_2 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_2:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_3()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_3")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_3 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_3 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_3 ) Passed False")

		GameRules.NPCList.kobold_laborer_3 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_3:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_4()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_4")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_4 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_4 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_4 ) Passed False")

		GameRules.NPCList.kobold_laborer_4 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_4:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_5()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_5")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_5 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_5 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_5 ) Passed False")

		GameRules.NPCList.kobold_laborer_5 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_5:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_6()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_6")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_6 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_6 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_6 ) Passed False")

		GameRules.NPCList.kobold_laborer_6 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_6:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_7()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_7")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_7 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_7 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_7 ) Passed False")

		GameRules.NPCList.kobold_laborer_7 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_7:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_8()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_8")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_8 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_8 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_8 ) Passed False")

		GameRules.NPCList.kobold_laborer_8 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_8:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_9()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_9")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_9 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_9 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_9 ) Passed False")

		GameRules.NPCList.kobold_laborer_9 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_9:SetOwner(spawn_location_ent)
	end

end



function spawn_kobold_laborer_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_10")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_10 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_10 ) Passed False")

		GameRules.NPCList.kobold_laborer_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_10:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_11()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_11")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_11 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_11 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_11 ) Passed False")

		GameRules.NPCList.kobold_laborer_11 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_11:SetOwner(spawn_location_ent)
	end

end





function spawn_kobold_laborer_12()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_12")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_12 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_12 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_12 ) Passed False")

		GameRules.NPCList.kobold_laborer_12 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_12:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_13()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_13")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_13 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_13 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_13 ) Passed False")

		GameRules.NPCList.kobold_laborer_13 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_13:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_14()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_14")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_14 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_14 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_14 ) Passed False")

		GameRules.NPCList.kobold_laborer_14 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_14:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_15()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_15")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_15 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_15 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_15 ) Passed False")

		GameRules.NPCList.kobold_laborer_15 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_15:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_16()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_16")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_16 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_16 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_16 ) Passed False")

		GameRules.NPCList.kobold_laborer_16 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_16:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_17()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_17")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_17 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_17 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_17 ) Passed False")

		GameRules.NPCList.kobold_laborer_17 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_17:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_18()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_18")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_18 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_18 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_18 ) Passed False")

		GameRules.NPCList.kobold_laborer_18 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_18:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_19()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_19")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_19 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_19 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_19 ) Passed False")

		GameRules.NPCList.kobold_laborer_19 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_19:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_20()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_20")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_20 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_20 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_20 ) Passed False")

		GameRules.NPCList.kobold_laborer_20 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_20:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_21()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_21")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_21 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_21 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_21 ) Passed False")

		GameRules.NPCList.kobold_laborer_21 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_21:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_22()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_22")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_22 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_22 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_22 ) Passed False")

		GameRules.NPCList.kobold_laborer_22 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_22:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_23()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_23")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_23 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_23 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_23 ) Passed False")

		GameRules.NPCList.kobold_laborer_23 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_23:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_24()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_24")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_24 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_24 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_24 ) Passed False")

		GameRules.NPCList.kobold_laborer_24 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_24:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_laborer_25()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_laborer_25")
	local npc_unit_name = "npc_dota_operation_candle_kobold_laborer"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_laborer_25 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_25 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_laborer_25 ) Passed False")

		GameRules.NPCList.kobold_laborer_25 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_laborer_25:SetOwner(spawn_location_ent)
	end

end




function spawn_kobold_slavehandler_1()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_1")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_1 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_1 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_1 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_1 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_1:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_1 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_1 did not create unit")
		end
	end

end


function spawn_kobold_slavehandler_2()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_2")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_2 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_2 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_2 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_2 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_2:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_2 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_2 did not create unit")
		end
	end

end


function spawn_kobold_slavehandler_3()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_3")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_3 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_3 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_3 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_3 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_3:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_3 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_3 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_4()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_4")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_4 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_4 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_4 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_4 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_4:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_4 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_4 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_5()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_5")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_5 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_5 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_5 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_5 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_5:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_5 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_5 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_6()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_6")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_6 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_6 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_6 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_6 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_6:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_6 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_6 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_7()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_7")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_7 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_7 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_7 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_7 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_7:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_7 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_7 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_8()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_8")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_8 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_8 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_8 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_8 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_8:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_8 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_8 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_9()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_9")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_9 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_9 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_9 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_9 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_9:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_9 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_9 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_10")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_10 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_10 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_10:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_10 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_10 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_11()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_11")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_11 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_11 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_11 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_11 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_11:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_11 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_11 did not create unit")
		end
	end

end

function spawn_kobold_slavehandler_12()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_miner_slavehandler_12")
	local npc_unit_name = "npc_dota_operation_candle_kobold_slavehandler"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.kobold_slavehandler_12 ) then
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_12 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.kobold_slavehandler_12 ) Passed False")

		GameRules.NPCList.kobold_slavehandler_12 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.kobold_slavehandler_12:SetOwner(spawn_location_ent)

		if GameRules.NPCList.kobold_slavehandler_12 then
		else
			print("[ Debug ] GameRules.NPCList.kobold_slavehandler_12 did not create unit")
		end
	end

end







function spawn_kobold_greater_lesser_wolf_1()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_1")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_1 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_1 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_1 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_1 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_1:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_1 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_1 did not create unit")
		end
	end

end




function spawn_kobold_greater_lesser_wolf_2()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_2")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_2 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_2 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_2 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_2 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_2:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_2 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_2 did not create unit")
		end
	end

end




function spawn_kobold_greater_lesser_wolf_3()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_3")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_3 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_3 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_3 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_3 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_3:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_3 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_3 did not create unit")
		end
	end

end




function spawn_kobold_greater_lesser_wolf_4()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_4")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_4 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_4 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_4 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_4 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_4:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_4 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_4 did not create unit")
		end
	end

end





function spawn_kobold_greater_lesser_wolf_5()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_5")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_5 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_5 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_5 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_5 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_5:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_5 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_5 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_6()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_6")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_6 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_6 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_6 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_6 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_6:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_6 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_6 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_7()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_7")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_7 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_7 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_7 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_7 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_7:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_7 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_7 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_8()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_8")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_8 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_8 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_8 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_8 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_8:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_8 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_8 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_9()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_9")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_9 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_9 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_9 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_9 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_9:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_9 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_9 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_10")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_10 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_10 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_10:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_10 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_10 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_11()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_11")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_11 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_11 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_11 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_11 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_11:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_11 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_11 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_12()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_12")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_12 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_12 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_12 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_12 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_12:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_12 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_12 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_13()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_13")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_13 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_13 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_13 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_13 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_13:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_13 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_13 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_14()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_14")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_14 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_14 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_14 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_14 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_14:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_14 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_14 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_15()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_15")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_15 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_15 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_15 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_15 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_15:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_15 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_15 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_16()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_16")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_16 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_16 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_16 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_16 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_16:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_16 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_16 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_17()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_17")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_17 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_17 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_17 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_17 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_17:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_17 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_17 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_18()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_18")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_18 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_18 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_18 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_18 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_18:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_18 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_18 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_19()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_19")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_19 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_19 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_19 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_19 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_19:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_19 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_19 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_20()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_20")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_20 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_20 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_20 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_20 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_20:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_20 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_20 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_21()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_21")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_21 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_21 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_21 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_21 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_21:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_21 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_21 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_22()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_22")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_22 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_22 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_22 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_22 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_22:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_22 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_22 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_23()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_23")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_23 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_23 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_23 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_23 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_23:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_23 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_23 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_24()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_24")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_24 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_24 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_24 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_24 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_24:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_24 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_24 did not create unit")
		end
	end

end


function spawn_kobold_greater_lesser_wolf_25()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_greater_lesser_wolf_25")
	local npc_unit_name = "npc_dota_operation_candle_greater_lesser_wolf"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.greater_lesser_wolf_25 ) then
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_25 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.greater_lesser_wolf_25 ) Passed False")

		GameRules.NPCList.greater_lesser_wolf_25 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.greater_lesser_wolf_25:SetOwner(spawn_location_ent)

		if GameRules.NPCList.greater_lesser_wolf_25 then
		else
			print("[ Debug ] GameRules.NPCList.greater_lesser_wolf_25 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_1()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_1")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_1 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_1 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_1 ) Passed False")

		GameRules.NPCList.staff_ogre_1 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_1:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_1 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_1 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_2()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_2")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_2 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_2 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_2 ) Passed False")

		GameRules.NPCList.staff_ogre_2 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_2:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_2 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_2 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_3()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_3")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_3 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_3 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_3 ) Passed False")

		GameRules.NPCList.staff_ogre_3 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_3:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_3 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_3 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_4()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_4")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_4 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_4 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_4 ) Passed False")

		GameRules.NPCList.staff_ogre_4 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_4:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_4 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_4 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_5()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_5")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_5 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_5 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_5 ) Passed False")

		GameRules.NPCList.staff_ogre_5 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_5:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_5 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_5 did not create unit")
		end
	end

end





function spawn_kobold_staff_ogre_6()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_6")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_6 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_6 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_6 ) Passed False")

		GameRules.NPCList.staff_ogre_6 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_6:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_6 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_6 did not create unit")
		end
	end

end







function spawn_kobold_staff_ogre_7()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_7")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_7 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_7 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_7 ) Passed False")

		GameRules.NPCList.staff_ogre_7 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_7:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_7 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_7 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_8()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_8")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_8 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_8 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_8 ) Passed False")

		GameRules.NPCList.staff_ogre_8 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_8:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_8 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_8 did not create unit")
		end
	end

end





function spawn_kobold_staff_ogre_9()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_9")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_9 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_9 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_9 ) Passed False")

		GameRules.NPCList.staff_ogre_9 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_9:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_9 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_9 did not create unit")
		end
	end

end







function spawn_kobold_staff_ogre_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_10")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_10 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_10 ) Passed False")

		GameRules.NPCList.staff_ogre_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_10:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_10 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_10 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_11()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_11")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_11 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_11 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_11 ) Passed False")

		GameRules.NPCList.staff_ogre_11 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_11:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_11 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_11 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_12()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_12")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_12 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_12 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_12 ) Passed False")

		GameRules.NPCList.staff_ogre_12 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_12:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_12 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_12 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_13()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_13")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_13 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_13 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_13 ) Passed False")

		GameRules.NPCList.staff_ogre_13 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_13:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_13 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_13 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_14()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_14")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_14 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_14 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_14 ) Passed False")

		GameRules.NPCList.staff_ogre_14 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_14:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_14 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_14 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_15()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_15")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_15 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_15 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_15 ) Passed False")

		GameRules.NPCList.staff_ogre_15 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_15:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_15 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_15 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_16()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_16")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_16 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_16 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_16 ) Passed False")

		GameRules.NPCList.staff_ogre_16 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_16:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_16 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_16 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_17()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_17")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_17 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_17 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_17 ) Passed False")

		GameRules.NPCList.staff_ogre_17 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_17:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_17 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_17 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_18()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_18")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_18 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_18 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_18 ) Passed False")

		GameRules.NPCList.staff_ogre_18 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_18:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_18 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_18 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_19()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_19")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_19 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_19 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_19 ) Passed False")

		GameRules.NPCList.staff_ogre_19 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_19:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_19 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_19 did not create unit")
		end
	end

end






function spawn_kobold_staff_ogre_20()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_staff_ogre_20")
	local npc_unit_name = "npc_dota_operation_candle_staff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.staff_ogre_20 ) then
		print("IsValidEntity( GameRules.NPCList.staff_ogre_20 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.staff_ogre_20 ) Passed False")

		GameRules.NPCList.staff_ogre_20 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.staff_ogre_20:SetOwner(spawn_location_ent)

		if GameRules.NPCList.staff_ogre_20 then
		else
			print("[ Debug ] GameRules.NPCList.staff_ogre_20 did not create unit")
		end
	end

end



function spawn_kobold_buff_ogre_1()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_1")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_1 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_1 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_1 ) Passed False")

		GameRules.NPCList.buff_ogre_1 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_1:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_1 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_1 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_2()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_2")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_2 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_2 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_2 ) Passed False")

		GameRules.NPCList.buff_ogre_2 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_2:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_2 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_2 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_3()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_3")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_3 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_3 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_3 ) Passed False")

		GameRules.NPCList.buff_ogre_3 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_3:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_3 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_3 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_4()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_4")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_4 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_4 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_4 ) Passed False")

		GameRules.NPCList.buff_ogre_4 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_4:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_4 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_4 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_5()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_5")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_5 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_5 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_5 ) Passed False")

		GameRules.NPCList.buff_ogre_5 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_5:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_5 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_5 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_6()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_6")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_6 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_6 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_6 ) Passed False")

		GameRules.NPCList.buff_ogre_6 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_6:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_6 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_6 did not create unit")
		end
	end

end

function spawn_kobold_buff_ogre_7()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_7")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_7 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_7 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_7 ) Passed False")

		GameRules.NPCList.buff_ogre_7 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_7:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_7 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_7 did not create unit")
		end
	end

end



function spawn_kobold_buff_ogre_8()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_8")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_8 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_8 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_8 ) Passed False")

		GameRules.NPCList.buff_ogre_8 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_8:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_8 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_8 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_9()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_9")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_9 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_9 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_9 ) Passed False")

		GameRules.NPCList.buff_ogre_9 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_9:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_9 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_9 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_10")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_10 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_10 ) Passed False")

		GameRules.NPCList.buff_ogre_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_10:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_10 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_10 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_11()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_11")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_11 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_11 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_11 ) Passed False")

		GameRules.NPCList.buff_ogre_11 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_11:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_11 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_11 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_12()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_12")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_12 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_12 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_12 ) Passed False")

		GameRules.NPCList.buff_ogre_12 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_12:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_12 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_12 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_13()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_13")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_13 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_13 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_13 ) Passed False")

		GameRules.NPCList.buff_ogre_13 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_13:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_13 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_13 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_14()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_14")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_14 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_14 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_14 ) Passed False")

		GameRules.NPCList.buff_ogre_14 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_14:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_14 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_14 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_15()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_15")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_15 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_15 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_15 ) Passed False")

		GameRules.NPCList.buff_ogre_15 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_15:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_15 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_15 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_16()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_16")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_16 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_16 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_16 ) Passed False")

		GameRules.NPCList.buff_ogre_16 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_16:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_16 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_16 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_17()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_17")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_17 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_17 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_17 ) Passed False")

		GameRules.NPCList.buff_ogre_17 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_17:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_17 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_17 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_18()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_18")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_18 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_18 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_18 ) Passed False")

		GameRules.NPCList.buff_ogre_18 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_18:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_18 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_18 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_19()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_19")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_19 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_19 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_19 ) Passed False")

		GameRules.NPCList.buff_ogre_19 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_19:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_19 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_19 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_20()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_20")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_20 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_20 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_20 ) Passed False")

		GameRules.NPCList.buff_ogre_20 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_20:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_20 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_20 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_21()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_21")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_21 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_21 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_21 ) Passed False")

		GameRules.NPCList.buff_ogre_21 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_21:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_21 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_21 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_22()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_22")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_22 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_22 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_22 ) Passed False")

		GameRules.NPCList.buff_ogre_22 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_22:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_22 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_22 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_23()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_23")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_23 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_23 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_23 ) Passed False")

		GameRules.NPCList.buff_ogre_23 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_23:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_23 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_23 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_24()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_24")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_24 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_24 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_24 ) Passed False")

		GameRules.NPCList.buff_ogre_24 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_24:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_24 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_24 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_25()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_25")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_25 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_25 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_25 ) Passed False")

		GameRules.NPCList.buff_ogre_25 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_25:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_25 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_25 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_26()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_26")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_26 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_26 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_26 ) Passed False")

		GameRules.NPCList.buff_ogre_26 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_26:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_26 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_26 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_27()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_27")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_27 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_27 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_27 ) Passed False")

		GameRules.NPCList.buff_ogre_27 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_27:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_27 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_27 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_28()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_28")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_28 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_28 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_28 ) Passed False")

		GameRules.NPCList.buff_ogre_28 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_28:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_28 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_28 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_29()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_29")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_29 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_29 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_29 ) Passed False")

		GameRules.NPCList.buff_ogre_29 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_29:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_29 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_29 did not create unit")
		end
	end

end


function spawn_kobold_buff_ogre_30()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_buff_ogre_30")
	local npc_unit_name = "npc_dota_operation_candle_buff_ogre"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.buff_ogre_30 ) then
		print("IsValidEntity( GameRules.NPCList.buff_ogre_30 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.buff_ogre_30 ) Passed False")

		GameRules.NPCList.buff_ogre_30 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.buff_ogre_30:SetOwner(spawn_location_ent)

		if GameRules.NPCList.buff_ogre_30 then
		else
			print("[ Debug ] GameRules.NPCList.buff_ogre_30 did not create unit")
		end
	end

end








--
--
--
--

function spawn_graveyard_melee_skeleton_01()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_01")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_01 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_01 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_01 ) Passed False")

		GameRules.NPCList.melee_skeleton_01 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_01:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_01 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_01 did not create unit")
		end
	end

end


function spawn_graveyard_melee_skeleton_02()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_02")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_02 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_02 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_02 ) Passed False")

		GameRules.NPCList.melee_skeleton_02 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_02:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_02 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_02 did not create unit")
		end
	end

end


function spawn_graveyard_melee_skeleton_03()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_03")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_03 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_03 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_03 ) Passed False")

		GameRules.NPCList.melee_skeleton_03 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_03:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_03 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_03 did not create unit")
		end
	end

end


function spawn_graveyard_melee_skeleton_04()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_04")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_04 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_04 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_04 ) Passed False")

		GameRules.NPCList.melee_skeleton_04 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_04:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_04 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_04 did not create unit")
		end
	end

end


function spawn_graveyard_melee_skeleton_05()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_05")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_05 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_05 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_05 ) Passed False")

		GameRules.NPCList.melee_skeleton_05 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_05:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_05 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_05 did not create unit")
		end
	end
end

function spawn_graveyard_melee_skeleton_06()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_06")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_06 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_06 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_06 ) Passed False")

		GameRules.NPCList.melee_skeleton_06 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_06:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_06 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_06 did not create unit")
		end
	end
end

function spawn_graveyard_melee_skeleton_07()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_07")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_07 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_07 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_07 ) Passed False")

		GameRules.NPCList.melee_skeleton_07 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_07:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_07 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_07 did not create unit")
		end
	end
end

function spawn_graveyard_melee_skeleton_08()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_08")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_08 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_08 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_08 ) Passed False")

		GameRules.NPCList.melee_skeleton_08 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_08:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_08 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_08 did not create unit")
		end
	end
end


function spawn_graveyard_melee_skeleton_09()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_09")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_09 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_09 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_09 ) Passed False")

		GameRules.NPCList.melee_skeleton_09 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_09:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_09 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_09 did not create unit")
		end
	end
end


function spawn_graveyard_melee_skeleton_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_melee_skeleton_10")
	local npc_unit_name = "npc_dota_operation_candle_melee_skeleton"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.melee_skeleton_10 ) then
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.melee_skeleton_10 ) Passed False")

		GameRules.NPCList.melee_skeleton_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.melee_skeleton_10:SetOwner(spawn_location_ent)

		if GameRules.NPCList.melee_skeleton_10 then
		else
			print("[ Debug ] GameRules.NPCList.melee_skeleton_10 did not create unit")
		end
	end
end




--
--
--


function spawn_graveyard_blue_ghost_01()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_01")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_01 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_01 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_01 ) Passed False")

		GameRules.NPCList.blue_ghost_01 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_01:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_01 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_01 did not create unit")
		end
	end
end


function spawn_graveyard_blue_ghost_02()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_02")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_02 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_02 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_02 ) Passed False")

		GameRules.NPCList.blue_ghost_02 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_02:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_02 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_02 did not create unit")
		end
	end
end




function spawn_graveyard_blue_ghost_03()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_03")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_03 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_03 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_03 ) Passed False")

		GameRules.NPCList.blue_ghost_03 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_03:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_03 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_03 did not create unit")
		end
	end
end


function spawn_graveyard_blue_ghost_04()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_04")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_04 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_04 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_04 ) Passed False")

		GameRules.NPCList.blue_ghost_04 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_04:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_04 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_04 did not create unit")
		end
	end
end



function spawn_graveyard_blue_ghost_05()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_05")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_05 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_05 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_05 ) Passed False")

		GameRules.NPCList.blue_ghost_05 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_05:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_05 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_05 did not create unit")
		end
	end
end


function spawn_graveyard_blue_ghost_06()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_06")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_06 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_06 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_06 ) Passed False")

		GameRules.NPCList.blue_ghost_06 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_06:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_06 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_06 did not create unit")
		end
	end
end


function spawn_graveyard_blue_ghost_07()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_07")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_07 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_07 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_07 ) Passed False")

		GameRules.NPCList.blue_ghost_07 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_07:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_07 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_07 did not create unit")
		end
	end
end


function spawn_graveyard_blue_ghost_08()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_08")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_08 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_08 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_08 ) Passed False")

		GameRules.NPCList.blue_ghost_08 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_08:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_08 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_08 did not create unit")
		end
	end
end


function spawn_graveyard_blue_ghost_09()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_09")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_09 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_09 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_09 ) Passed False")

		GameRules.NPCList.blue_ghost_09 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_09:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_09 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_09 did not create unit")
		end
	end
end



function spawn_graveyard_blue_ghost_10()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_blue_ghost_10")
	local npc_unit_name = "npc_dota_operation_candle_blue_ghost"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.blue_ghost_10 ) then
		print("IsValidEntity( GameRules.NPCList.blue_ghost_10 ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.blue_ghost_10 ) Passed False")

		GameRules.NPCList.blue_ghost_10 = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.blue_ghost_10:SetOwner(spawn_location_ent)

		if GameRules.NPCList.blue_ghost_10 then
		else
			print("[ Debug ] GameRules.NPCList.blue_ghost_10 did not create unit")
		end
	end
end


function spawn_wolf_mother_boss()
	local spawn_location_ent = Entities:FindByName(nil, "npc_spawn_location_wolf_mother")
	local npc_unit_name = "npc_dota_operation_candle_wolf_mother"
	--[[
		global var name = GameRules.NPCList.lesser_wolf_one
	]]
	local spawn_location_origin = spawn_location_ent:GetAbsOrigin()

	if IsValidEntity( GameRules.NPCList.wolf_mother ) then
		print("IsValidEntity( GameRules.NPCList.wolf_mother ) Passed True")

	else
		print("IsValidEntity( GameRules.NPCList.wolf_mother ) Passed False")

		GameRules.NPCList.wolf_mother = CreateUnitByName(npc_unit_name, spawn_location_origin, true, nil, nil, DOTA_TEAM_NEUTRALS)
		GameRules.NPCList.wolf_mother:SetOwner(spawn_location_ent)

		if GameRules.NPCList.wolf_mother then
		else
			print("[ Debug ] GameRules.NPCList.wolf_mother did not create unit")
		end
	end
end
