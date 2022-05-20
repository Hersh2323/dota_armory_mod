function arcane_assault_projectile(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local ProjectileTABLE = {
	        EffectName = "particles/units/heroes/hero_invoker/invoker_base_attack.vpcf",
	        Ability = ability,
	        Target = target,
	        Source = caster,
	        bDodgeable = false,
	        bProvidesVision = false,
	        vSpawnOrigin = caster:GetAbsOrigin(),
	        iMoveSpeed = 1600,
	        iVisionRadius = 0,
	        iVisionTeamNumber = caster:GetTeamNumber(),
	        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
	    }

	ProjectileManager:CreateTrackingProjectile(ProjectileTABLE)

end


