function proc_unrelenting(event)
	local caster = event.caster
	local ability = event.ability
	local mana_proc_value = ability:GetLevelSpecialValueFor("bonus_mana_proc", 0)

	local can_this_proc = is_unrelenting_set_active(caster)
	if can_this_proc == true then
		--print("[Debug][ can_this_proc true]")
		caster:GiveMana(mana_proc_value)

		--GameRules:SendCustomMessage("[ Debug ][ unrelenting_set proc ][ BONUS MANA GAINED ]", 0, 0)


	else
		--print("[Debug][ can_this_proc false]")
	end
end

function is_unrelenting_set_active(caster) -- this returns true or false
	if caster then
		local total_equipped = return_total_equipped_unrelenting_items(caster)
		if total_equipped then
			if total_equipped >= 4 then
				return true
			else
				return false
			end
		end
	end
end

function return_total_equipped_unrelenting_items(caster)
	if caster then
        local count = 0
        for itemSlot=0,5 do
            local items = caster:GetItemInSlot(itemSlot)
            if items then
                if string.find(items:GetName(), "unrelenting_set") then
                	count = count+1
                end
            end
        end
    	return count
	end
end