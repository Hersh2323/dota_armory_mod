function grantMana(target, intManaValue)
	local target = target
	local intManaValue = intManaValue

	target:GiveMana(intManaValue)
end


function lc_d2_trinket_proc(event)
	local caster = event.caster
	local ability = event.ability

	local mana_value = ability:GetLevelSpecialValueFor("mana_proc", 0)

	grantMana(caster, mana_value)
end

function lc_base_auto_attack_mana_gain(event)
	local caster = event.caster
	local ability = event.ability

	local mana_value = ability:GetLevelSpecialValueFor("mana_per_auto_attack", 0)

	grantMana(caster, mana_value)
end

