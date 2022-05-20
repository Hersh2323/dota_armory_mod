function proc_unjustified(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target



	local can_this_proc = is_unjustified_set_active(caster)
	if can_this_proc == true then


		--GameRules:SendCustomMessage("[ Debug ][ unjusified set is active ]", 0, 0)
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_unjustified_set_stats_buff_datadriven", {})

	else
		--print("[Debug][ can_this_proc false]")
	end


end

function is_unjustified_set_active(caster) -- this returns true or false
	if caster then
		local total_equipped = return_total_equipped_unjustified_set_items(caster)
		if total_equipped then
			if total_equipped >= 4 then
				return true
			else
				return false
			end
		end
	end
end

function return_total_equipped_unjustified_set_items(caster)



	if caster then
        local count = 0
        for itemSlot=0,5 do
            local items = caster:GetItemInSlot(itemSlot)
            if items then
                if string.find(items:GetName(), "unjustified_set") then
                	count = count+1
                end
            end
        end

    	return count
	end
end