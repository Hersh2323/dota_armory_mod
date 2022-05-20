function mana_regen_tick(event)
	local caster = event.caster
	local ability = event.ability

	local mana_value = ability:GetLevelSpecialValueFor("regen_mana", ability:GetLevel() -1 )
	caster:GiveMana(mana_value)

end