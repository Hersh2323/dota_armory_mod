function regen_tick(event)
	local caster = event.caster
	local ability = event.ability

	-- health
	local combat = caster:FindModifierByName("modifier_hero_combat_datadriven")
	local max_hp = caster:GetMaxHealth()
	local health_regen_5_sec_tick_pct = GLOBAL_VARIABLE_MAX_HEALTH_REGEN_PCT_PER_5_FLOAT
	if IsThisUnitInCombat(caster) then
		local in_combat_reduction = health_regen_5_sec_tick_pct/5

		caster:Heal( max_hp*in_combat_reduction, caster )
		--GameRules:SendCustomMessage("[ Debug ][ Combat: heal in combat for: " .. max_hp*in_combat_reduction, 0, 0)
	else

		caster:Heal( max_hp*health_regen_5_sec_tick_pct, caster )
		--GameRules:SendCustomMessage("[ Debug ][ Combat: heal outof combat for: " .. max_hp*health_regen_5_sec_tick_pct, 0, 0)
	end
	--ability:StartCooldown(5.0)

	-- mana
	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then

		local current_int = caster:GetIntellect()
		local non_fsr_mana_gain = current_int*GLOBAL_VARIABLE_MANA_REGEN_PER_INT 		--print("[Debug][ regen_tick() - non_fsr_mana_gain: " .. non_fsr_mana_gain)
		local fsr_mana_gain = non_fsr_mana_gain*GLOBAL_VARIABLE_FSR_PERCENTAGE			--print("[Debug][ regen_tick() - fsr_mana_gain: " .. fsr_mana_gain)

		local is_fsr = IsThisUnitInFiveSecRule(caster)

		if is_fsr == true then
			caster:GiveMana(fsr_mana_gain)
		else
		end

		if is_fsr == false then
			caster:GiveMana(non_fsr_mana_gain)
		else
		end

	else
	end

end