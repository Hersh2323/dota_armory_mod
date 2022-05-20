function remove_wrath(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local modifier = target:FindModifierByNameAndCaster("modifier_magus_of_wrath_proc_buff_datadriven", caster)
	if modifier then
		modifier:Destroy()
	else
	end
end

function start_cd(event)
	local caster = event.caster
	local ability = event.ability
	local cd = ability:GetCooldown(ability:GetLevel() )

	if ability:IsCooldownReady() then
		ability:StartCooldown(cd)
	else
	end
end

function apply_modifier_if_not_cd(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if ability:IsCooldownReady() then
		if target:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
			ability:ApplyDataDrivenModifier(caster, target, "modifier_magus_of_wrath_proc_buff_datadriven", {} )
		else
		end
	else
	end
end