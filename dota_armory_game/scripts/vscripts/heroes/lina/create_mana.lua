function regen_tick(event)
	local caster = event.caster
	local ability = event.ability

	local mana_bonus = ability:GetLevelSpecialValueFor("mana_bonus_pct", 1)
	local mana_bonus_percent_float = mana_bonus / 100
	local max_total_mana = caster:GetMaxMana()
	local mana_to_gain = mana_bonus_percent_float*max_total_mana

	caster:GiveMana(mana_to_gain/3)
end

function int_buff_for_int_heroes(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	if target:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
		ability:ApplyDataDrivenModifier(caster, target, "modifier_mana_creation_int_buff_datadriven", {})
	else
	end
end