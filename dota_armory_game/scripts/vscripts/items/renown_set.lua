function proc_renown_mana(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local mana_proc_value = ability:GetLevelSpecialValueFor("bonus_mana_proc", 0)
	local mana_proc_cooldown = ability:GetLevelSpecialValueFor("proc_cooldown", 0)

	if ability:IsCooldownReady() then
		ability:StartCooldown(mana_proc_cooldown)
		caster:GiveMana(mana_proc_value)
		print("[Debug][ Mana gain proc ]")
	else
	end


end
