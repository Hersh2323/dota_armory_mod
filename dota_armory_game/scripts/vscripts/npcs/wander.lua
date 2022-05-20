function spinUnit(event)
	local caster = event.caster
	local ability = event.ability
	local int = disabled
	--RandomInt(1, 2) 

	local combat_modifier = caster:FindModifierByName("modifier_combat_active_datadriven")

	-- fix to combat_modifier to endable
	if combat_modifier then
	else
		if int == 1 then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_rotate_npc_clockwise_modifier", {} )

		elseif int == 2 then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_rotate_npc_counter_clockwise_modifier", {} )


		end
	end
end





-- this is called by npcs when modifier: modifier_combat_active_datadriven fades from ability npc_data_ability_datadriven
function walk_home(event)
	if IsValidEntity(event.caster) then
		local caster = event.caster
		local ability = event.ability

		local parent_ent = caster:GetOwner()
		if parent_ent then
			print("[Debug][walk_home - parent_ent exists]")
			--caster:MoveToPositionAggressive(parent_ent:GetAbsOrigin() )

			FindClearSpaceForUnit(caster, parent_ent:GetAbsOrigin(), false)	
			local max_hp = caster:GetMaxHealth()
			caster:Heal(max_hp, ability)
			caster:Stop()

		else
		end
	else
	end
end

