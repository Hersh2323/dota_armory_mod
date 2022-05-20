function proc_glory(event)
	local caster = event.caster
	local ability = event.ability

	local can_this_proc = is_glory_set_active(caster)
	if can_this_proc == true then
		--print("[Debug][ can_this_proc true]")

		local heal_percent = ability:GetLevelSpecialValueFor("proc_heal_pct", 0)
		local heal_percent_float = heal_percent/100
		--print("[Debug][heal_percent_float]" .. heal_percent_float)

		local max_hp = caster:GetMaxHealth() 
		--print("[Debug][max_hp]" .. max_hp)

		local heal_value = heal_percent_float*max_hp
		--print("[Debug][heal value]" .. heal_value)

		local heal_value_ceil = math.ceil(heal_value)
		--print("[Debug][heal_value_ceil]" .. heal_value)

		caster:Heal(heal_value, caster)
		PopupHealing(caster, heal_value_ceil)
		StartAnimation(caster, {duration=0.5, activity=ACT_DOTA_CAST_ABILITY_2, rate=2.0})
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_glorious_set_glory_proc_buff_datadriven", {})



	else
		--print("[Debug][ can_this_proc false]")
	end
end

function is_glory_set_active(caster) -- this returns true or false
	if caster then
		local total_equipped = return_total_equipped_glory_items(caster)
		if total_equipped then
			if total_equipped >= 2 then
				return true
			else
				return false
			end
		end
	end
end

function return_total_equipped_glory_items(caster)
	if caster then
        local count = 0
        for itemSlot=0,5 do
            local items = caster:GetItemInSlot(itemSlot)
            if items then
                if string.find(items:GetName(), "glorious_set") then
                	count = count+1
                end
            end
        end
    	return count
	end
end