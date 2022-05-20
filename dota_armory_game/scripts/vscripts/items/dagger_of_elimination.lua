function check_cd_apply_debuff_elim(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target


	if caster:IsRangedAttacker() then
		if ability:IsCooldownReady() then
			if caster and target then
				ability:StartCooldown( ability:GetCooldown(ability:GetLevel()) )
				ability:ApplyDataDrivenModifier(caster, target, "modifier_dagger_of_elimination_debuff_datadriven", {} )
			else
			end
		else
		end
	else
	end
end




function FireProjectile(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local projectileSpeed = ability:GetLevelSpecialValueFor("projectile_speed", ability:GetLevel() )

	local projectile_info = 
    {
        EffectName = "particles/units/heroes/hero_drow/drow_base_attack.vpcf",
        Ability = ability,
        vSpawnOrigin = caster:GetAbsOrigin(),
        Target = target,
        Source = caster,
        bHasFrontalCone = false,
        iMoveSpeed = projectileSpeed,
        bReplaceExisting = false,
        bProvidesVision = false
    }

   	ProjectileManager:CreateTrackingProjectile(projectile_info)
   	StartAnimation(caster, {duration=0.5, activity=ACT_DOTA_ATTACK, rate=2.5})

end