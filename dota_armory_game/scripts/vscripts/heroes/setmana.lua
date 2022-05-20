function lc_set_mana_to_zero_on_spawn(event)
	local caster = event.caster
	local ability = event.ability

	if caster then
		local caster_mana = caster:GetMaxMana()	print("[ Debug ][ caster_mana: " .. caster_mana)
		--caster:SetMana(1)
		caster:SetMana(1)

	end
end