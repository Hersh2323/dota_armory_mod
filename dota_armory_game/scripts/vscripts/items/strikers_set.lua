function proc_strikers(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.unit


	if ability:IsCooldownReady() then

		local proc_min = ability:GetLevelSpecialValueFor("proc_min_health_pct", 0)
		local proc_max = ability:GetLevelSpecialValueFor("proc_max_health_pct", 0)
		local target_hp_pct = target:GetHealthPercent()

		if target_hp_pct > proc_min and target_hp_pct < proc_max then
			--print("[Debug][target_hp_pct]" .. target_hp_pct)

			local cooldown_timer = ability:GetLevelSpecialValueFor("proc_internal_cd", 0)
			ability:StartCooldown(cooldown_timer)

			ability:ApplyDataDrivenModifier(caster, caster, "modifier_strikers_set_striking_proc_buff_datadriven", {})

		end
	else
	end
end


--[[		these are no longer used
function is_strikers_set_active(caster) -- this returns true or false
	if caster then
		local total_equipped = return_total_equipped_strikers_set_items(caster)
		if total_equipped then
			if total_equipped >= 2 then
				return true
			else
				return false
			end
		end
	end
end

function return_total_equipped_strikers_set_items(caster)



	if caster then
        local count = 0
        for itemSlot=0,5 do
            local items = caster:GetItemInSlot(itemSlot)
            if items then
                if string.find(items:GetName(), "strikers_set") then
                	count = count+1
                end
            end
        end

    	return count
	end
end
]]
