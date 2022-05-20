function drink_potion(event)
	local caster = event.caster
	local ability = event.ability
	local max_hp_pct = ability:GetLevelSpecialValueFor("heal_max_hp_pct", 0) 
	local max_hp_pct_float = max_hp_pct/100
	--print("[Debug][Potion][ max_hp_pct_float:" .. max_hp_pct_float .. "]")

	local max_hp = caster:GetMaxHealth()
	local heal_value = max_hp*max_hp_pct_float
	--print("[Debug][Potion][ heal_value:" .. heal_value .. "]")

	caster:Heal(heal_value, caster)

	local attr = caster:GetPrimaryAttribute()
	if attr == DOTA_ATTRIBUTE_INTELLECT then
		print("[Debug][primary attr is intellect]")
		local max_mana = caster:GetMaxMana()
		local max_mana_pct = ability:GetLevelSpecialValueFor("potion_max_mana_pct", 0)
		local max_mana_pct_float = max_mana_pct/100

		local mana_to_grant =  max_mana*max_mana_pct_float
		caster:GiveMana(mana_to_grant)


	else
	end

	local is_in_combat = IsThisUnitInCombat(caster)
	if is_in_combat == true then
		StartCombatWithThisUnit(caster)
	else
	end
end