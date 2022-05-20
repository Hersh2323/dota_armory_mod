function checkCombat(event)
	local caster = event.caster
	local ability = event.ability

	if caster:IsAttacking() then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_combat_active_datadriven", {} )
		--print("[ Debug ][ npc IsAttacking() ]")
	end

	local potential_enemy = caster:GetAttackTarget()
	if potential_enemy then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_combat_active_datadriven", {} )
		--print("[ Debug ][ GetAttackTarget() not nil ]")

	end

end

function combatIfMovingAndInCombat(event)
	local caster = event.caster
	local ability = event.ability

	local combat_active = caster:FindModifierByName("modifier_combat_active_datadriven")

	if combat_active then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_combat_active_datadriven", {} )
	end

end