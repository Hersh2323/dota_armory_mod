function stat_proc(event)
	local caster = event.caster
	local ability = event.ability

	if ability:IsCooldownReady() then

		local ability_cd = ability:GetCooldown(ability:GetLevel())
		ability:StartCooldown(ability_cd)


		if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_i6_trinket_of_chance_buff_int_datadriven", {})
		else
		end

		if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_AGILITY then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_i6_trinket_of_chance_buff_agi_datadriven", {})
		else
		end

		if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_STRENGTH then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_i6_trinket_of_chance_buff_str_datadriven", {})
		else
		end





	else
	end
end

function stat_use(event)
	local caster = event.caster
	local ability = event.ability

	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_i6_trinket_of_certainty_buff_int_datadriven", {})
	else
	end

	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_AGILITY then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_i6_trinket_of_certainty_buff_agi_datadriven", {})
	else
	end

	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_STRENGTH then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_i6_trinket_of_certainty_buff_str_datadriven", {})
	else
	end
end

function stat_proc_more(event)
	local caster = event.caster
	local ability = event.ability

	if ability:IsCooldownReady() then

		local ability_cd = ability:GetCooldown(ability:GetLevel())
		ability:StartCooldown(ability_cd)


		if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_i12_trinket_of_more_chance_buff_int_datadriven", {})
		else
		end

		if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_AGILITY then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_i12_trinket_of_more_chance_buff_agi_datadriven", {})
		else
		end

		if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_STRENGTH then
			ability:ApplyDataDrivenModifier(caster, caster, "modifier_i12_trinket_of_more_chance_buff_str_datadriven", {})
		else
		end
	else
	end
end

function stat_use_more(event)
	local caster = event.caster
	local ability = event.ability

	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_INTELLECT then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_i12_trinket_of_more_certainty_buff_int_datadriven", {})
	else
	end

	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_AGILITY then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_i12_trinket_of_more_certainty_buff_agi_datadriven", {})
	else
	end

	if caster:GetPrimaryAttribute() == DOTA_ATTRIBUTE_STRENGTH then
		ability:ApplyDataDrivenModifier(caster, caster, "modifier_i12_trinket_of_more_certainty_buff_str_datadriven", {})
	else
	end
end






function proc_rapidity(event)
	local caster = event.caster
	local ability = event.ability

	if ability:IsCooldownReady() then

		local ability_cd = ability:GetCooldown(ability:GetLevel())
		ability:StartCooldown(ability_cd)

		ability:ApplyDataDrivenModifier(caster, caster, "modifier_trinket_of_rapidity_buff_proc_datadriven", {})

	else
	end
end
