-- c_func.lua is used for functions that can be called globally 


function c_func_respawn_npcs()

	--  This functions purpose is to be called in order to respawn npcs in the gamemode. This will be called by hero abilities respawn npcs, and also called when the gamemode begins in order to have npcs alive when the player first spawns in.
	--  This function will also be filtered by mapname in the event that multiple maps will be available, and thus calling different npcs.
	--  note: this function must be able to be executed globally
	--  H

	if GameRules.NPCList then 
	else 
		GameRules.NPCList = {} 
		print("[ DEBUG ] GameRules.NPCList created")
	end

	local mapname = GetMapName()
	GameRules:SendCustomMessage("[ Game ] Respawn npc function has been executed", 0, 0)
	--print("[ DEBUG ] c_func_respawn_npcs: " .. mapname )
	if mapname == "operation_candle" then

		spawn_lesser_wolf_one()
		spawn_lesser_wolf_two()
		spawn_lesser_wolf_three()
		spawn_lesser_wolf_four()
		spawn_lesser_wolf_five()
		spawn_lesser_wolf_six()
		spawn_lesser_wolf_seven()
		spawn_lesser_wolf_eight()
		spawn_lesser_wolf_nine()
		spawn_lesser_wolf_ten()
		spawn_lesser_wolf_eleven()
		spawn_lesser_wolf_twelve()
		spawn_lesser_wolf_thirteen()
		spawn_lesser_wolf_fourteen()
		spawn_lesser_wolf_fifteen()
		spawn_lesser_wolf_sixteen()
		spawn_lesser_wolf_seventeen()
		spawn_lesser_wolf_eighteen()
		spawn_lesser_wolf_nineteen()
		spawn_lesser_wolf_twenty()
		spawn_lesser_wolf_twentyone()
		spawn_lesser_wolf_twentytwo()
		spawn_lesser_wolf_twentythree()
		spawn_lesser_wolf_twentyfour()
		spawn_lesser_wolf_twentyfive()
		spawn_lesser_wolf_twentysix()
		spawn_lesser_wolf_twentyseven()
		spawn_lesser_wolf_twentyeight()
		spawn_lesser_wolf_twentynine()
		spawn_lesser_wolf_thirty()
		spawn_lesser_wolf_thirtyone()
		spawn_lesser_wolf_thirtytwo()
		spawn_lesser_wolf_thirtythree()
		spawn_lesser_wolf_thirtyfour()
		spawn_lesser_wolf_thirtyfive()

		spawn_kobold_vermin_1()
		spawn_kobold_vermin_2()
		spawn_kobold_vermin_3()
		spawn_kobold_vermin_4()
		spawn_kobold_vermin_5()
		spawn_kobold_vermin_6()
		spawn_kobold_vermin_7()
		spawn_kobold_vermin_8()
		spawn_kobold_vermin_9()
		spawn_kobold_vermin_10()
		spawn_kobold_vermin_11()
		spawn_kobold_vermin_12()
		spawn_kobold_vermin_13()
		spawn_kobold_vermin_14()
		spawn_kobold_vermin_15()
		spawn_kobold_vermin_16()
		spawn_kobold_vermin_17()
		spawn_kobold_vermin_18()
		spawn_kobold_vermin_19()
		spawn_kobold_vermin_20()
		spawn_kobold_vermin_21()
		spawn_kobold_vermin_22()
		spawn_kobold_vermin_23()
		spawn_kobold_vermin_24()
		spawn_kobold_vermin_25()
		spawn_kobold_vermin_26()
		spawn_kobold_vermin_27()
		spawn_kobold_vermin_28()
		spawn_kobold_vermin_29()
		spawn_kobold_vermin_30()

		spawn_kobold_worker_1()
		spawn_kobold_worker_2()
		spawn_kobold_worker_3()
		spawn_kobold_worker_4()
		spawn_kobold_worker_5()
		spawn_kobold_worker_6()
		spawn_kobold_worker_7()
		spawn_kobold_worker_8()
		spawn_kobold_worker_9()
		spawn_kobold_worker_10()
		spawn_kobold_worker_11()
		spawn_kobold_worker_12()
		spawn_kobold_worker_13()
		spawn_kobold_worker_14()
		spawn_kobold_worker_15()
		spawn_kobold_worker_16()
		spawn_kobold_worker_17()
		spawn_kobold_worker_18()
		spawn_kobold_worker_19()
		spawn_kobold_worker_20()

		spawn_kobold_laborer_1()
		spawn_kobold_laborer_2()
		spawn_kobold_laborer_3()
		spawn_kobold_laborer_4()
		spawn_kobold_laborer_5()
		spawn_kobold_laborer_6()
		spawn_kobold_laborer_7()
		spawn_kobold_laborer_8()
		spawn_kobold_laborer_9()
		spawn_kobold_laborer_10()
		spawn_kobold_laborer_11()
		spawn_kobold_laborer_12()
		spawn_kobold_laborer_13()
		spawn_kobold_laborer_14()
		spawn_kobold_laborer_15()
		spawn_kobold_laborer_16()
		spawn_kobold_laborer_17()
		spawn_kobold_laborer_18()
		spawn_kobold_laborer_19()
		spawn_kobold_laborer_20()
		spawn_kobold_laborer_21()
		spawn_kobold_laborer_22()
		spawn_kobold_laborer_23()
		spawn_kobold_laborer_24()
		spawn_kobold_laborer_25()

		spawn_kobold_slavehandler_1()
		spawn_kobold_slavehandler_2()
		spawn_kobold_slavehandler_3()
		spawn_kobold_slavehandler_4()
		spawn_kobold_slavehandler_5()
		spawn_kobold_slavehandler_6()
		spawn_kobold_slavehandler_7()
		spawn_kobold_slavehandler_8()
		spawn_kobold_slavehandler_9()
		spawn_kobold_slavehandler_10()
		spawn_kobold_slavehandler_11()
		spawn_kobold_slavehandler_12()

		spawn_kobold_greater_lesser_wolf_1()
		spawn_kobold_greater_lesser_wolf_2()
		spawn_kobold_greater_lesser_wolf_3()
		spawn_kobold_greater_lesser_wolf_4()
		spawn_kobold_greater_lesser_wolf_5()
		spawn_kobold_greater_lesser_wolf_6()
		spawn_kobold_greater_lesser_wolf_7()
		spawn_kobold_greater_lesser_wolf_8()
		spawn_kobold_greater_lesser_wolf_9()
		spawn_kobold_greater_lesser_wolf_10()
		spawn_kobold_greater_lesser_wolf_11()
		spawn_kobold_greater_lesser_wolf_12()
		spawn_kobold_greater_lesser_wolf_13()
		spawn_kobold_greater_lesser_wolf_14()
		spawn_kobold_greater_lesser_wolf_15()
		spawn_kobold_greater_lesser_wolf_16()
		spawn_kobold_greater_lesser_wolf_17()
		spawn_kobold_greater_lesser_wolf_18()
		spawn_kobold_greater_lesser_wolf_19()
		spawn_kobold_greater_lesser_wolf_20()
		spawn_kobold_greater_lesser_wolf_21()
		spawn_kobold_greater_lesser_wolf_22()
		spawn_kobold_greater_lesser_wolf_23()
		spawn_kobold_greater_lesser_wolf_24()
		spawn_kobold_greater_lesser_wolf_25()



		spawn_kobold_staff_ogre_1()
		spawn_kobold_staff_ogre_2()
		spawn_kobold_staff_ogre_3()
		spawn_kobold_staff_ogre_4()
		spawn_kobold_staff_ogre_5()
		spawn_kobold_staff_ogre_6()
		spawn_kobold_staff_ogre_7()
		spawn_kobold_staff_ogre_8()
		spawn_kobold_staff_ogre_8()
		spawn_kobold_staff_ogre_10()
		spawn_kobold_staff_ogre_11()
		spawn_kobold_staff_ogre_12()
		spawn_kobold_staff_ogre_13()
		spawn_kobold_staff_ogre_14()
		spawn_kobold_staff_ogre_15()
		spawn_kobold_staff_ogre_16()
		spawn_kobold_staff_ogre_17()
		spawn_kobold_staff_ogre_18()
		spawn_kobold_staff_ogre_19()
		spawn_kobold_staff_ogre_20()

		spawn_kobold_buff_ogre_1()
		spawn_kobold_buff_ogre_2()
		spawn_kobold_buff_ogre_3()
		spawn_kobold_buff_ogre_4()
		spawn_kobold_buff_ogre_5()
		spawn_kobold_buff_ogre_6()
		spawn_kobold_buff_ogre_7()
		spawn_kobold_buff_ogre_8()
		spawn_kobold_buff_ogre_9()
		spawn_kobold_buff_ogre_10()
		spawn_kobold_buff_ogre_11()
		spawn_kobold_buff_ogre_12()
		spawn_kobold_buff_ogre_13()
		spawn_kobold_buff_ogre_14()
		spawn_kobold_buff_ogre_15()
		spawn_kobold_buff_ogre_16()
		spawn_kobold_buff_ogre_17()
		spawn_kobold_buff_ogre_18()
		spawn_kobold_buff_ogre_19()
		spawn_kobold_buff_ogre_20()
		spawn_kobold_buff_ogre_21()
		spawn_kobold_buff_ogre_22()
		spawn_kobold_buff_ogre_23()
		spawn_kobold_buff_ogre_24()
		spawn_kobold_buff_ogre_25()
		spawn_kobold_buff_ogre_26()
		spawn_kobold_buff_ogre_27()
		spawn_kobold_buff_ogre_28()
		spawn_kobold_buff_ogre_29()
		spawn_kobold_buff_ogre_30()

		spawn_graveyard_melee_skeleton_01()
		spawn_graveyard_melee_skeleton_02()
		spawn_graveyard_melee_skeleton_03()
		spawn_graveyard_melee_skeleton_04()
		spawn_graveyard_melee_skeleton_05()
		spawn_graveyard_melee_skeleton_06()
		spawn_graveyard_melee_skeleton_07()
		spawn_graveyard_melee_skeleton_08()
		spawn_graveyard_melee_skeleton_09()
		spawn_graveyard_melee_skeleton_10()

		spawn_graveyard_blue_ghost_01()
		spawn_graveyard_blue_ghost_02()
		spawn_graveyard_blue_ghost_03()
		spawn_graveyard_blue_ghost_04()
		spawn_graveyard_blue_ghost_05()
		spawn_graveyard_blue_ghost_06()
		spawn_graveyard_blue_ghost_07()
		spawn_graveyard_blue_ghost_08()
		spawn_graveyard_blue_ghost_09()
		spawn_graveyard_blue_ghost_10()

		spawn_wolf_mother_boss()

		c_func_start_rescaling_npc_health()
	else
	end
end



function c_func_increment_current_alive_npcs()
	if global_variable_current_alive_npc_count then

		global_variable_current_alive_npc_count = global_variable_current_alive_npc_count+1
		print("[ DEBUG ][ global_variable_current_alive_npc_count has been incremented to " .. global_variable_current_alive_npc_count .. " ]")
	else

		global_variable_current_alive_npc_count = 1
		print("[ DEBUG ][ global_variable_current_alive_npc_count has been incremented to " .. global_variable_current_alive_npc_count .. " ]")
	end

end


function c_func_decrement_current_alive_npcs()
	if global_variable_current_alive_npc_count then

		global_variable_current_alive_npc_count = global_variable_current_alive_npc_count-1
		print("[ DEBUG ][ global_variable_current_alive_npc_count has been decremented to " .. global_variable_current_alive_npc_count .. " ]")
	else

		global_variable_current_alive_npc_count = 1
		print("[ DEBUG ][ global_variable_current_alive_npc_count has been decremented to " .. global_variable_current_alive_npc_count .. " ]")
	end
end



function c_func_call_to_adjust_npc_stats()
	local npcs = GameRules.NPCList

	if npcs then
		for _,unit in pairs(npcs) do

			unit:RemoveModifierByName("modifier_npc_stat_adjustment_modifier")
		end
	end
end




function c_func_increment_additional_difficulty_and_return_updated_int()
	if GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL then

		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL + 1
		--print("[ Debug ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL increased to " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")
		GameRules:SendCustomMessage("[ Game ] ---------------- Additional difficulty increased to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL ..  "  ----------------", 0, 0)


		return GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL
	else

		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 1

		--print("[ Debug ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL increased to " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")
		GameRules:SendCustomMessage("[ Game ] ---------------- Additional difficulty increased to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL ..  "  ----------------", 0, 0)

		return GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL
	end
end


function c_func_reduce_additional_difficulty_and_return_updated_int()
	if GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL then

		if GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL > 0 then

			GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL - 1
			--print("[ Debug ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL reduced to " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")
			GameRules:SendCustomMessage("[ Game ] ---------------- Additional difficulty reduced to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL ..  "  ----------------", 0, 0)

			return GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL
		else

			GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 0
			--print("[ Debug ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL reduced to " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")
			GameRules:SendCustomMessage("[ Game ] ---------------- Additional difficulty reduced to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL ..  "  ----------------", 0, 0)

			return GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL
		end

	else

		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 0
		return GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL
	end
end

function c_func_call_additional_difficulty_with_no_interation_and_return_int()
	if GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL then

		--print("[ Debug ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")
		return GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL
	else
		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 0
		--print("[ Debug ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")
		return GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL
	end
end

function c_func_call_base_hero_level_no_iteration_return_int()

	return GLOBAL_VARIABLE_CURRENT_HERO_LEVEL
end

function c_func_call_combined_difficulty_return_int()

	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL and GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL then

		GLOBAL_VARIABLE_COMBINED_DIFFICULTY = c_func_call_base_hero_level_no_iteration_return_int() + c_func_call_additional_difficulty_with_no_interation_and_return_int()

	return GLOBAL_VARIABLE_COMBINED_DIFFICULTY
	end
end

function c_func_start_rescaling_npc_health()
	local npcs = GameRules.NPCList

	if npcs then
		for _,unit in pairs(npcs) do


			if IsValidEntity(unit) then
				unit:RemoveModifierByName("modifier_npc_scaling_modifier_remove_me_to_init_scaling_function_datadriven")
			end
		end
	end
end

function c_func_increment_total_players()

	if GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME then
		GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME = GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME+1
		print("[ Debug ][ GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME increased to: " .. GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME .. " ]")

	else
		GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME = 1
		print("[ Debug ][ GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME increased to: " .. GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME .. " ]")

	end

end

function c_func_decrement_total_players()

	if GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME then
		GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME = GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME-1
		print("[ Debug ][ GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME reduced to: " .. GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME .. " ]")
	else
		GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME = 0
		print("[ Debug ][ GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME reduced to: " .. GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME .. " ]")
	end

end

function c_func_return_total_active_players_as_int()
	print("[ Debug ][ GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME returned: " .. GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME .. " ]")
	return GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME
end

--[[
function c_func_return_orange_drop_string(level_range)
	if not level_range then print("[Debug][c_func_return_orange_drop_string(level_range) has failed to pass level_range variable]")
	local item_roll = RandomInt(1, 1)
	if item_roll = 1 then return  end
end
]]


function c_func_orange_drop_success(caster, ability)
	if caster and ability then
		local caster = caster
		local ability = ability
		local drop_location = caster:GetAbsOrigin()



	else
		print("[Debug][ c_func_orange_drop_success(caster, ability) has failed. caster and or ability as nil ]")
	end
end

function c_func_determine_orange_item_drop_return_item_string()
end




















function c_func_create_and_launch_this_drop_at_loc(caster, drop_item)
	local caster = caster
	local drop_item = drop_item

	if caster and drop_item then

		print("[DEBUG][Loot][ Dropping item: " .. drop_item)

		local item = CreateItem(drop_item, nil, nil)
        local pos = caster:GetAbsOrigin()
        local drop = CreateItemOnPositionSync( pos, item )
        local pos_launch = pos+RandomVector(RandomFloat(150,200))
        item:LaunchLoot(false, 275, 0.5, pos_launch)


	end
end




function c_func_purple_drop_success(caster, ability)
	if caster and ability then
		local caster = caster
		local ability = ability
		local drop_location = caster:GetAbsOrigin()

		local drop_item = c_func_determine_purple_item_drop_return_item_string()

		if drop_item then

			c_func_create_and_launch_this_drop_at_loc(caster, drop_item)

	    else
	    	print("[DEBUG][Loot][ c_func_determine_purple_item_drop_return_item_string() failed to retrieve an item for c_func_purple_drop_success(caster, ability)")
		end

	else
		print("[Debug][ c_func_purple_drop_success(caster, ability) has failed. caster and or ability as nil ]")
	end
end



function c_func_determine_purple_item_drop_return_item_string()


	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL < 6 then

		local roll = RandomInt(1, 3)
		print("[Debug][ 1 to 5 drops ][roll: " .. roll .. " ]")
		if roll == 1 then return "item_i6_main_stat_str_sword_sword_of_impending_storms_datadriven" end
		if roll == 2 then return "item_i6_main_stat_int_staff_battle_staff_of_guidance_datadriven" end
		if roll == 3 then return "item_i6_main_stat_agi_dagger_dagger_of_striking_datadriven" end

	else
	end

	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL >= 6 then

		local roll = RandomInt(1, 15)
		print("[Debug][ 6 to 12 drops ][roll: " .. roll .. " ]")
		if roll == 1 then return "item_i12_misc_pauldrons_of_the_unraveler_datadriven" end
		if roll == 2 then return "item_i12_misc_shoulderguard_of_the_huntress_datadriven" end
		if roll == 3 then return "item_i12_misc_noble_wizards_mantle_datadriven" end
		if roll == 4 then return "item_i12_main_stat_int_staff_great_menders_staff_of_perpetual_baa_datadriven" end
		if roll == 5 then return "item_i12_main_stat_int_staff_magus_staff_of_wrath_datadriven" end
		if roll == 6 then return "item_i12_main_stat_str_sword_great_axe_of_rending_datadriven" end
		if roll == 7 then return "item_i12_main_stat_str_sword_swiftblade_of_sundering_datadriven" end
		if roll == 8 then return "item_i12_main_stat_agi_dagger_dagger_of_elimination_datadriven" end
		if roll == 9 then return "item_i12_main_stat_agi_dagger_dagger_of_expedience_datadriven" end
		if roll == 10 then return "item_i12_trinket_of_more_chance_datadriven" end
		if roll == 11 then return "item_i12_trinket_of_more_certainty_datadriven" end
		if roll == 12 then return "item_i12_trinket_of_rapidity_datadriven" end
		if roll == 13 then return "item_i12_healer_trinket_of_regeneration_datadriven" end
		if roll == 14 then return "item_i12_misc_finger_of_dagon_datadriven" end
		if roll == 15 then return "item_i12_misc_wizards_tear_datadriven" end

	else
	end




end








function c_func_blue_drop_success(caster, ability)
	if caster and ability then
		local caster = caster
		local ability = ability
		local drop_location = caster:GetAbsOrigin()

		local drop_item = c_func_determine_blue_item_drop_return_item_string()

		if drop_item then

			c_func_create_and_launch_this_drop_at_loc(caster, drop_item)

	    else
	    	print("[DEBUG][Loot][ c_func_determine_blue_item_drop_return_item_string() failed to retrieve an item for c_func_blue_drop_success(caster, ability)")
		end

	else
		print("[Debug][ c_func_blue_drop_success(caster, ability) has failed. caster and or ability as nil ]")
	end
end

function c_func_determine_blue_item_drop_return_item_string()



	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL < 6 then
		local roll = RandomInt(1, 8)
		print("[Debug][ 1 to 5 drops ][roll: " .. roll .. " ]")

		if roll == 1 then return "item_i6_main_stat_str_sword_sharpened_blade_datadriven" end
		if roll == 2 then return "item_i6_main_stat_int_staff_polished_battle_staff_datadriven" end
		if roll == 3 then return "item_i6_main_stat_agi_dagger_sharpened_dagger_datadriven" end

		-- added A2.0b
		if roll == 4 then return "item_i6_berserking_bracers_datadriven" end
		if roll == 5 then return "item_i6_nimble_bracers_datadriven" end
		if roll == 6 then return "item_i6_thought_provoking_bracers_datadriven" end
		if roll == 7 then return "item_i6_trinket_of_chance_datadriven" end
		if roll == 8 then return "item_i6_trinket_of_certainty_datadriven" end

	else
	end

	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL >= 6 then
		local roll = RandomInt(1, 10)
		print("[Debug][ 6 to 12 drops ][roll: " .. roll .. " ]")

		if roll == 1 then return "item_i11_main_stat_int_staff_usually_reliable_staff_datadriven" end
		if roll == 2 then return "item_i11_misc_robes_of_the_unusual_datadriven" end
		if roll == 3 then return "item_i11_main_stat_agi_dagger_dagger_of_indifference_datadriven" end
		if roll == 4 then return "item_i11_misc_tunic_of_difference_datadriven" end
		if roll == 5 then return "item_i11_main_stat_str_sword_adequately_crafted_sword_datadriven" end
		if roll == 6 then return "item_i11_misc_nicely_forged_breastplate_datadriven" end
		if roll == 7 then return "item_i10_misc_convenient_keepsake_datadriven" end
		if roll == 8 then return "item_i12_misc_antique_necklace_datadriven" end
		if roll == 9 then return "item_i12_misc_hardened_brace_datadriven" end
		if roll == 10 then return "item_i12_misc_agile_shoulderguard_datadriven" end
	else
	end
end








function c_func_green_drop_success(caster, ability)
	if caster and ability then
		local caster = caster
		local ability = ability
		local drop_location = caster:GetAbsOrigin()

		local drop_item = c_func_determine_green_item_drop_return_item_string()

		if drop_item then

			c_func_create_and_launch_this_drop_at_loc(caster, drop_item)

	    else
	    	print("[DEBUG][Loot][ c_func_determine_green_item_drop_return_item_string() failed to retrieve an item for c_func_green_drop_success(caster, ability)")
		end

	else
		print("[Debug][ c_func_green_drop_success(caster, ability) has failed. caster and or ability as nil ]")
	end
end

function c_func_determine_green_item_drop_return_item_string()



	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL < 6 then

		local roll = RandomInt(1, 10)
		print("[Debug][Loot:Green][ 1 to 5 drops ][roll: " .. roll .. " ]")
		-- i3
		if roll == 1 then return "item_i3_boots_crystal_datadriven" end
		if roll == 2 then return "item_i3_crystal_datadriven" end
		if roll == 3 then return "item_i3_main_stat_str_sword_datadriven" end
		if roll == 4 then return "item_i3_main_stat_agi_dagger_datadriven" end
		if roll == 5 then return "item_i3_main_stat_int_staff_datadriven" end
		-- i6
		if roll == 6 then return "item_i6_boots_crystal_datadriven" end
		if roll == 7 then return "item_i6_crystal_datadriven" end
		if roll == 8 then return "item_i6_main_stat_str_sword_datadriven" end
		if roll == 9 then return "item_i6_main_stat_agi_dagger_datadriven" end
		if roll == 10 then return "item_i6_main_stat_int_staff_datadriven" end

	else
	end

	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL >= 6 then

		local roll = RandomInt(1, 10)
		print("[Debug][Loot:Green][ 6 to 12 drops ][roll: " .. roll .. " ]")
		-- i3
		if roll == 1 then return "item_i9_boots_crystal_datadriven" end
		if roll == 2 then return "item_i9_crystal_datadriven" end
		if roll == 3 then return "item_i12_boots_crystal_datadriven" end
		if roll == 4 then return "item_i12_crystal_datadriven" end
		if roll == 5 then return "item_i8_main_stat_str_sword_datadriven" end
		if roll == 6 then return "item_i8_main_stat_agi_dagger_datadriven" end
		if roll == 7 then return "item_i8_main_stat_int_staff_datadriven" end
		if roll == 8 then return "item_i10_main_stat_str_sword_datadriven" end
		if roll == 9 then return "item_i10_main_stat_agi_dagger_datadriven" end
		if roll == 10 then return "item_i10_main_stat_int_staff_datadriven" end

	else
	end
end





function c_func_white_drop_success(caster, ability)
	if caster and ability then
		local caster = caster
		local ability = ability
		local drop_location = caster:GetAbsOrigin()

		local drop_item = c_func_determine_white_item_drop_return_item_string()

		if drop_item then
			print("[Debug][Loot][c_func_white_drop_success(caster, ability)] " .. drop_item)

			c_func_create_and_launch_this_drop_at_loc(caster, drop_item)

	    else
	    	print("[DEBUG][Loot][ c_func_determine_white_item_drop_return_item_string() failed to retrieve an item for c_func_white_drop_success(caster, ability)")
		end

	else
		print("[Debug][ c_func_white_drop_success(caster, ability) has failed. caster and or ability as nil ]")
	end
end

function c_func_determine_white_item_drop_return_item_string()

	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL < 6 then

		local roll = RandomInt(1, 6)
		--print("[Debug][ 1 to 5 drops ][roll: " .. roll .. " ]")

		if roll == 1 then return "item_i6_giants_toe_datadriven" end
		if roll == 2 then return "item_i6_fleas_knees_datadriven" end
		if roll == 3 then return "item_i1_misc_rock_datadriven" end
		if roll == 4 then return "item_i5_misc_quickstone_datadriven" end
		if roll == 5 then return "item_i5_misc_chancestone_datadriven" end
		if roll == 6 then return "item_i5_misc_furystone_datadriven" end



	else
	end

	if GLOBAL_VARIABLE_CURRENT_HERO_LEVEL >= 6 then

		local roll = RandomInt(1, 3)
		--print("[Debug][ 6 to 12 drops ][roll: " .. roll .. " ]")

		if roll == 1 then return "item_i10_misc_quickstone_datadriven" end
		if roll == 2 then return "item_i10_misc_chancestone_datadriven" end
		if roll == 3 then return "item_i10_misc_furystone_datadriven" end

	else
	end
end




function c_func_get_exp_required_for_this_level(level)
	if level then
		if level == 1 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl1_to_2EXP end
		if level == 2 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl2_to_3EXP end
		if level == 3 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl3_to_4EXP end
		if level == 4 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl4_to_5EXP end
		if level == 5 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl5_to_6EXP end
		if level == 6 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl6_to_7EXP end
		if level == 7 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl7_to_8EXP end
		if level == 8 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl8_to_9EXP end
		if level == 9 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl9_to_10EXP end
		if level == 10 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl10_to_11EXP end
		if level == 11 then return GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl11_to_12EXP end
		if level >= MAX_LEVEL then return nil end
	else
	end
end



function return_critical_strike_roll_success(caster)
	local crit_roll = RandomFloat(0, 100)
	local total_crit_chance = get_crit_chance_float(caster)

	print("[Debug][ Critical strike system ][ roll: " .. crit_roll .. " crit chance: " .. total_crit_chance .. " ]")

	if crit_roll <= total_crit_chance then
		return true
	else
		return false
	end
end


function get_crit_chance_float(caster)
	local base_crit_chance = return_role_base_crit_chance(caster)
	local additional_crit_chance = return_additional_critical_strike_chance_pct_float(caster)

	return base_crit_chance+additional_crit_chance
end

function return_additional_critical_strike_chance_pct_float(caster)
    local bonus_crit_chance_from_items_and_abilities = 0
    for abilitySlot=0,5 do
        local ability = caster:GetAbilityByIndex(abilitySlot)
        if ability then
        	--print("[Debug][ ability: " .. ability:GetName())
        	local additional_crit_chance = ability:GetLevelSpecialValueFor("bonus_crit_chance", 1)
        	bonus_crit_chance_from_items_and_abilities = bonus_crit_chance_from_items_and_abilities+additional_crit_chance
        	if additional_crit_chance  then print("[Debug][ Crit Chance ][ Additional crit chance from ability: " .. ability:GetName() .. " increased by: " ..  additional_crit_chance) else end
        end
    end
    for itemSlot=0,5 do
        local ability = caster:GetItemInSlot(itemSlot)
        if ability then
        	--print("[Debug][ ability: " .. ability:GetName())
        	local additional_crit_chance = ability:GetLevelSpecialValueFor("bonus_crit_chance", 1)
        	bonus_crit_chance_from_items_and_abilities = bonus_crit_chance_from_items_and_abilities+additional_crit_chance
        	if additional_crit_chance  then print("[Debug][ Crit Chance ][ Additional crit chance from ability: " .. ability:GetName() .. " increased by: " ..  additional_crit_chance) else end
        end
    end
    return bonus_crit_chance_from_items_and_abilities
end

function return_role_base_crit_chance(caster)
	if IsValidEntity(caster) then
		local primary_attribute = caster:GetPrimaryAttribute()

		if primary_attribute == DOTA_ATTRIBUTE_STRENGTH then
			return GLOBAL_STR_HERO_BASE_CRIT_CHANCE
		else
		end

		if primary_attribute == DOTA_ATTRIBUTE_AGILITY then
			if caster:IsRangedAttacker() then
				return GLOBAL_AGI_RANGED_HERO_BASE_CRIT_CHANCE
			else
				return GLOBAL_AGI_HERO_BASE_CRIT_CHANCE
			end
		else
		end

		if primary_attribute == DOTA_ATTRIBUTE_INTELLECT then
			return GLOBAL_INT_HERO_BASE_CRIT_CHANCE
		else
		end
	else
	end
end



-- crit damage
function get_crit_damage_float(caster)
	local base_crit_damage = return_role_base_crit_damage(caster)
	local additional_crit_damage = return_additional_critical_strike_damage_pct_float(caster)

	return base_crit_damage+additional_crit_damage
end

function return_additional_critical_strike_damage_pct_float(caster)
    local bonus_crit_damage_from_items_and_abilities = 0
    for abilitySlot=0,5 do
        local ability = caster:GetAbilityByIndex(abilitySlot)
        if ability then
        	--print("[Debug][ ability: " .. ability:GetName())
        	local additional_crit_damage = ability:GetLevelSpecialValueFor("bonus_crit_damage", 1)
        	bonus_crit_damage_from_items_and_abilities = bonus_crit_damage_from_items_and_abilities+additional_crit_damage
        	if additional_crit_damage  then print("[Debug][ Crit damage ][ Additional crit damage from ability: " .. ability:GetName() .. " increased by: " ..  additional_crit_damage) else end
        end
    end
    for itemSlot=0,5 do
        local ability = caster:GetItemInSlot(itemSlot)
        if ability then
        	--print("[Debug][ ability: " .. ability:GetName())
        	local additional_crit_damage = ability:GetLevelSpecialValueFor("bonus_crit_damage", 1)
        	bonus_crit_damage_from_items_and_abilities = bonus_crit_damage_from_items_and_abilities+additional_crit_damage
        	if additional_crit_damage  then print("[Debug][ Crit damage ][ Additional crit damage from ability: " .. ability:GetName() .. " increased by: " ..  additional_crit_damage) else end
        end
    end
    return bonus_crit_damage_from_items_and_abilities/100
end

function return_role_base_crit_damage(caster)
	if IsValidEntity(caster) then
		local primary_attribute = caster:GetPrimaryAttribute()

		if primary_attribute == DOTA_ATTRIBUTE_STRENGTH then
			return GLOBAL_STR_HERO_BASE_CRIT_DAMAGE
		else
		end

		if primary_attribute == DOTA_ATTRIBUTE_AGILITY then
			if caster:IsRangedAttacker() then
				return GLOBAL_AGI_RANGED_HERO_BASE_CRIT_DAMAGE
			else
				return GLOBAL_AGI_HERO_BASE_CRIT_DAMAGE
			end
		else
		end

		if primary_attribute == DOTA_ATTRIBUTE_INTELLECT then
			return GLOBAL_INT_HERO_BASE_CRIT_DAMAGE
		else
		end
	else
	end
end

-- modifier_combat_active_datadriven will be the universal modifier to determine if combat
function IsThisUnitInCombat(unit)
	if unit then
		local combat_modifier_buff = unit:FindModifierByName("modifier_combat_active_datadriven")

		if combat_modifier_buff then
			return true
		else
			return false
		end
	else
	end
end

function StartCombatWithThisUnit(unit)
	if unit then
		local heroes_combat_ability = unit:FindAbilityByName("hero_custom_stats_datadriven")
		if heroes_combat_ability then
			heroes_combat_ability:ApplyDataDrivenModifier(unit, unit, "modifier_combat_active_datadriven", {})
			heroes_combat_ability:StartCooldown(8.0)
		else
		end
	else
	end
end


--[[
"RunScript"
{
    "ScriptFile"    "c_func.lua"
    "Function"      "StartCombatWithThisUnit_kv"
}
]]

function StartCombatWithThisUnit_kv(event)
	local unit = event.caster
	local ability = unit:FindAbilityByName("hero_custom_stats_datadriven")
	if unit then
		local heroes_combat_ability = unit:FindAbilityByName("hero_custom_stats_datadriven")
		if heroes_combat_ability then
			heroes_combat_ability:ApplyDataDrivenModifier(unit, unit, "modifier_combat_active_datadriven", {})
			heroes_combat_ability:StartCooldown(8.0)

		else
		end
	else
	end
end



-- modifier_5_sec_rule_identifier_datadriven will be the universal modifier to determine if unit has recently cast a spell - this only applies to int heroes and is manually linked to abilities
function IsThisUnitInFiveSecRule(unit)
	if unit then
		local five_sec_rule_modifier = unit:FindModifierByName("modifier_5_sec_rule_identifier_datadriven")

		if five_sec_rule_modifier then
			return true
		else
			return false
		end
	else
	end
end

function StartFiveSecRuleWithThisUnit(unit)
	if unit then
		local fsr_ability = unit:FindAbilityByName("hero_custom_stats_datadriven")
		if fsr_ability then
			fsr_ability:ApplyDataDrivenModifier(unit, unit, "modifier_5_sec_rule_identifier_datadriven", {})
		else
		end
	else
	end
end


--[[
"RunScript"
{
    "ScriptFile"    "c_func.lua"
    "Function"      "StartFiveSecRuleWithThisUnit_kv"
}
]]

function StartFiveSecRuleWithThisUnit_kv(event)
	local unit = event.caster
	if unit then
		local fsr_ability = unit:FindAbilityByName("hero_custom_stats_datadriven")
		if fsr_ability then
			fsr_ability:ApplyDataDrivenModifier(unit, unit, "modifier_5_sec_rule_identifier_datadriven", {})
		else
		end
	else
	end
end


function return_unit_label_multiplier_float(unit_label)

	if unit_label == "GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_MINION" then
		return GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_MINION
	else
	end
	if unit_label == "GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_ELITE" then
		return GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_ELITE
	else
	end
	if unit_label == "GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_BOSS" then
		return GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_BOSS
	else
	end
	if unit_label == "GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD" then
		return GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD
	else
	end


	
	return 1.0
end





function cf_force_camera_on_this_unit_no_duration(playerID, hTarget)

	local target = hTarget
	local playerID = target:GetPlayerID()

	if playerID and target then

		PlayerResource:SetCameraTarget(playerID, target)

		Timers:CreateTimer(0.1, function()
			PlayerResource:SetCameraTarget(playerID, nil)
			return
		end
		)

	else
		print("[Debug][Error][ cf_force_camera_on_this_unit_no_duration(playerID, hTarget) has failed to acquire a playerID or target. ]")
	end
end



function cf_is_gatherin_node_valid(this_unit)
	local node = this_unit

	if IsValidEntity(node) then

		local gathering_active = node:FindModifierByName("modifier_gathering_node_active_datadriven")		print("[Debug][cf_is_gatherin_node_valid(this_unit)]")

		if gathering_active then
			return true
		else
			return false
		end
	else
		return nil
	end
end