function regen_mana(event)
	local caster = event.caster
	local ability = event.ability
	local mana_proc = ability:GetLevelSpecialValueFor("mana_proc", ability:GetLevel() )


	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
		caster:GiveMana(mana_proc)
	else
	end

end