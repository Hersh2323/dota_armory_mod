function levelupthisunit(self)
	local unit = self

	if unit then
		print("[Debug][Dialog][ levelupthisunit(self) ran and detected self ]")
	else
	end
end

function print_alive(event)
	local caster = event.caster
	local ability = event.ability

	print("[Debug][Dialog][ print_alive(event) ran ]")

--[[
	local unit_label = caster:GetUnitLabel()
	if unit_label then
		print("[Debug][Dialog][ unit_label: " .. unit_label)
	else
	end

	local unit_name = caster:GetUnitName()
	if unit_name then
		print("[Debug][Dialog][ unit_name: " .. unit_name)
	else
	end


	local entity_index = caster:GetEntityIndex()
	if entity_index then
		print("[Debug][Dialog][ entity_index: " .. entity_index)
	else
	end

	local entity_handle = caster:GetEntityHandle()
	if entity_handle then
		print("[Debug][Dialog][ entity_handle: " .. entity_handle)
	else
	end

	local debug_name = caster:GetDebugName()
	if debug_name then
		print("[Debug][Dialog][ debug_name: " .. debug_name)
	else
	end

]]

	local entity_name = caster:GetName()
	if entity_name then
		print("[Debug][Dialog][ entity_name: " .. entity_name)
	else
	end


end

function open_dialog_window(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target
	local hero = target:GetPlayerID()
	local entity_name = caster:GetName()
	local window_duration = 300
	--Notifications:Bottom(hero, {text="#first_test_dialog", duration=300, style={color="black", ["font-size"]="22px", border="2px solid black"} })


	if entity_name == "dialog_town_blacksmith_1" then
		Notifications:Bottom(hero, {text="#dialog_town_blacksmith_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_town_blacksmith_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_town_blacksmith_2" then
		Notifications:Bottom(hero, {text="#dialog_town_blacksmith_2_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_town_blacksmith_2", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_town_alley_1" then
		Notifications:Bottom(hero, {text="#dialog_town_alley_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_town_alley_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_town_mayor_1" then
		Notifications:Bottom(hero, {text="#dialog_town_mayor_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_town_mayor_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_town_local_cultist_1" then
		Notifications:Bottom(hero, {text="#dialog_town_local_cultist_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_town_local_cultist_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		--Notifications:Bottom(hero, {text="#dialog_town_local_cultist_1_reward_text", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_road_annoying_golem" then
		Notifications:Bottom(hero, {text="#dialog_road_annoying_golem_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_road_annoying_golem_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_road_fisher_golem" then
		Notifications:Bottom(hero, {text="#dialog_road_fisher_golem_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_road_fisher_golem_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_road_gatekeeper_golem" then
		Notifications:Bottom(hero, {text="#dialog_road_gatekeeper_golem_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_road_gatekeeper_golem_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_portal_elder_golem" then
		Notifications:Bottom(hero, {text="#dialog_portal_elder_golem_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_portal_elder_golem_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end

	if entity_name == "dialog_smartest_man_alive" then
		Notifications:Bottom(hero, {text="#dialog_smartest_man_alive_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_smartest_man_alive_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_smartest_man_alive_2", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })

		
	else
	end

	if entity_name == "dialog_sign_stonethrow_pond" then
		Notifications:Bottom(hero, {text="#dialog_sign_stonethrow_pond_1_greet", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
		Notifications:Bottom(hero, {text="#dialog_sign_stonethrow_pond_1", duration=window_duration, style={color="black", ["font-size"]="22px", border="2px solid black"} })
	else
	end


end

function close_dialog_window(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target
	local hero = target:GetPlayerID()

	Notifications:ClearBottom(hero)
end