
function initial_drop( event )
	local ability = event.ability
	local caster = event.caster


	local has_item_dropped = false
	local has_item_dropped_roll = RandomFloat(0, 100)
	--print("[ DEBUG ][  An item has dropped with a roll of : " .. has_item_dropped_roll)

	local white_chance = GLOBAL_VARIABLE_WHITE_DROP_CHANCE
	local green_chance = GLOBAL_VARIABLE_GREEN_DROP_CHANCE
	local blue_chance =	GLOBAL_VARIABLE_BLUE_DROP_CHANCE
	local purple_chance = GLOBAL_VARIABLE_PURPLE_DROP_CHANCE
	local orange_chance	= GLOBAL_VARIABLE_ORANGE_DROP_CHANCE

	-- we want to determine if they highest of rarity items are to drop, so we start to check if orange followed by purple etc is a successful roll
	if has_item_dropped_roll <= orange_chance then
		--print("[ DEBUG ][  An item has dropped with a roll of : " .. has_item_dropped_roll .. " thus drop is orange")
		--GameRules:SendCustomMessage("[ Debug ][ Loot ][ Orange ]" .. has_item_dropped_roll, 0, 0)

	else
		if has_item_dropped_roll <= purple_chance then
			--print("[ DEBUG ][  An item has dropped with a roll of : " .. has_item_dropped_roll .. " thus drop is purple")
			--GameRules:SendCustomMessage("[ Debug ][ Loot ][ Purple ]" .. has_item_dropped_roll, 0, 0)
			c_func_purple_drop_success(caster, ability)

		else
			if has_item_dropped_roll <= blue_chance then
				--print("[ DEBUG ][  An item has dropped with a roll of : " .. has_item_dropped_roll .. " thus drop is blue")
				--GameRules:SendCustomMessage("[ Debug ][ Loot ][ Blue ]" .. has_item_dropped_roll, 0, 0)
				c_func_blue_drop_success(caster, ability)

			else
				if has_item_dropped_roll <= green_chance then
					--print("[ DEBUG ][  An item has dropped with a roll of : " .. has_item_dropped_roll .. " thus drop is green")
					--GameRules:SendCustomMessage("[ Debug ][ Loot ][ Green ]" .. has_item_dropped_roll, 0, 0)
					c_func_green_drop_success(caster, ability)

				else
					if has_item_dropped_roll <= white_chance then
						--print("[ DEBUG ][  An item has dropped with a roll of : " .. has_item_dropped_roll .. " thus drop is white")
						--GameRules:SendCustomMessage("[ Debug ][ Loot ][ White ]" .. has_item_dropped_roll, 0, 0)
						c_func_white_drop_success(caster, ability)

					elseif has_item_dropped_roll > white_chance then
						--print("[ DEBUG ][  An item has dropped with a roll of : " .. has_item_dropped_roll .. " thus drop is none")
						--GameRules:SendCustomMessage("[ Debug ][ Loot ][ None ]" .. has_item_dropped_roll, 0, 0)
					else
					end
				end
			end			
		end
	end






end

--[[
function determine_loot_based_on_rarity(rarity)
	if not rarity then
		print("determine_loot_based_on_rarity(rarity) failed, did not pass rarity variable")
	end
	local drop_quality = rarity 

	if drop_quality = orange then
	else
	end


end
]]



function launch_function()

end