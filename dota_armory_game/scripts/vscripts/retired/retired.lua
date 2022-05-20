--[[
function c_func_increment_additional_difficulty()
	if GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL then
		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL+1
		print("[ DEBUG ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL increased to ][ " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")

		GameRules:SendCustomMessage("[ Game ] ---------------- DIFFICULTY SCALING ----------------", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Current hero max level: " .. GLOBAL_VARIABLE_CURRENT_HERO_LEVEL .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Additional difficulty increased to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Combined difficulty: " .. c_func_return_combined_difficulty() .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] ----------------------------------------------------", 0, 0)

	else
		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 1
		print("[ DEBUG ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL increased to ][ " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")
		
		GameRules:SendCustomMessage("[ Game ] ----------------------------------------------------", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Current hero max level: " .. GLOBAL_VARIABLE_CURRENT_HERO_LEVEL .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Additional difficulty increased to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Combined difficulty: " .. c_func_return_combined_difficulty() .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] ----------------------------------------------------", 0, 0)

	end
end

function c_func_decrement_additional_difficulty()
	if GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL then

		if GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL > 0 then
			GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL-1
			print("[ DEBUG ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL decreased to ][ " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")

			GameRules:SendCustomMessage("[ Game ] ---------------- DIFFICULTY SCALING ----------------", 0, 0)
			GameRules:SendCustomMessage("[ Game ] Current hero max level: " .. GLOBAL_VARIABLE_CURRENT_HERO_LEVEL .. "", 0, 0)
			GameRules:SendCustomMessage("[ Game ] Additional difficulty decreased to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. "", 0, 0)
			GameRules:SendCustomMessage("[ Game ] Combined difficulty: " .. c_func_return_combined_difficulty() .. "", 0, 0)
			GameRules:SendCustomMessage("[ Game ] ----------------------------------------------------", 0, 0)

		else
			GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 0
			print("[ DEBUG ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL decreased to ][ " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")

			GameRules:SendCustomMessage("[ Game ] ---------------- DIFFICULTY SCALING ----------------", 0, 0)
			GameRules:SendCustomMessage("[ Game ] Current hero max level: " .. GLOBAL_VARIABLE_CURRENT_HERO_LEVEL .. "", 0, 0)
			GameRules:SendCustomMessage("[ Game ] Additional difficulty cannot be reduced below " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. "", 0, 0)
			GameRules:SendCustomMessage("[ Game ] Combined difficulty: " .. c_func_return_combined_difficulty() .. "", 0, 0)
			GameRules:SendCustomMessage("[ Game ] ----------------------------------------------------", 0, 0)

		end

	else
		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 0
		print("[ DEBUG ][ GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL decreased to ][ " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. " ]")

		GameRules:SendCustomMessage("[ Game ] ---------------- DIFFICULTY SCALING ----------------", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Current hero max level: " .. GLOBAL_VARIABLE_CURRENT_HERO_LEVEL .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Additional difficulty decreased to: " .. GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] Combined difficulty: " .. c_func_return_combined_difficulty() .. "", 0, 0)
		GameRules:SendCustomMessage("[ Game ] ----------------------------------------------------", 0, 0)

	end
end

function c_func_return_combined_difficulty()

	GLOBAL_VARIABLE_COMBINED_DIFFICULTY = GLOBAL_VARIABLE_CURRENT_HERO_LEVEL + GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL

return  GLOBAL_VARIABLE_COMBINED_DIFFICULTY
end


]]
--[[
	function c_func_scale_all_npcs_difficulty()
		local npcs = GameRules.NPCList

		if npcs then
			for _,unit in pairs(npcs) do

				if IsValidEntity(unit) then

					c_func_scale_unit_health(unit)
				else
				end
			end
		end
	end

]]

--[[
	function c_func_test_modifier_removal()
		local npcs = GameRules.NPCList

		if npcs then
			for _,unit in pairs(npcs) do

				unit:RemoveModifierByName("")
			end
		end
	end

	function c_func_scale_unit_health(unit)

	--local unit = unit
	local current_difficulty = c_func_return_combined_difficulty()
	print("[ DEBUG ] current_difficulty" .. current_difficulty )

	local base_health = GLOBAL_VARIABLE_HERO_DPS_PER_LEVEL*current_difficulty
	print("[ DEBUG ] base_health" .. base_health )
	local additional_health = current_difficulty*GLOBAL_VARIABLE_ADDITIONAL_HEALTH_PER_LEVEL
	print("[ DEBUG ] additional_health" .. additional_health )
	local health = base_health+additional_health
	print("[ DEBUG ] health" .. health )

	-- unit:CreatureLevelUp(current_difficulty)
	unit:SetBaseMaxHealth(health)

end
]]
