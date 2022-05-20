function cast_howl(event)
	local ability = event.ability
	local caster = event.caster
	local base_cd = ability:GetCooldown(ability:GetLevel() )

	if ability:IsCooldownReady() then
		ability:StartCooldown(base_cd)
		caster:CastAbilityNoTarget(oc_wolf_howl, caster:GetEntityIndex() )
	else
	end
end