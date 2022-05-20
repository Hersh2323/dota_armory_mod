function check_invis(event)
	local caster = event.caster
	local ability = event.ability

	local is_invis_denial_active = caster:FindModifierByName("modifier_invis_denial_datadriven")

	if is_invis_denial_active then
	else
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_blue_ghost_invis_buff_datadriven", {})
	end
end

function suicide_damage(event)
	local caster = event.caster
	local ability = event.ability
end


function suicide_itself(event)
	local caster = event.caster
	local ability = event.ability

	if caster and ability then
		caster:ForceKill(true)
	end
end