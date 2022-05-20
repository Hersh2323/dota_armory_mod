function regen_mana(event)
	local caster = event.caster
	local ability = event.ability
	local current_int = caster:GetIntellect()
	local int_to_mana_multiplier = ability:GetLevelSpecialValueFor("int_to_mana_ratio", ability:GetLevel())

	local mana_bonus = current_int*int_to_mana_multiplier
	print("[Debug]regen_mana: " .. mana_bonus)

	caster:GiveMana(mana_bonus)
end