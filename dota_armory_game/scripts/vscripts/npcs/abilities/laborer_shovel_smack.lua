function shovel_smack(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target
	local health_pct = ability:GetLevelSpecialValueFor("health_percent_in_dmg", 0) 
	local health_pct_div_100 = health_pct / 100

	local internal_cd_modifier = caster:FindModifierByName("modifier_shovel_smack_cooldown_datadriven")

	if internal_cd_modifier then
	else
		--print("[ Debug ][ caster does not have 'modifier_shovel_smack_cooldown_datadriven' ]")

		local target_max_hp = target:GetMaxHealth()
		local dmg_to_deal = target_max_hp*health_pct_div_100
		local damage_type = ability:GetAbilityDamageType()

		local damageTable = {
			victim = target,
			attacker = caster,
			damage_type = damage_type,
			damage = dmg_to_deal
		}
		 
		ApplyDamage(damageTable)

		local poof_particle = ParticleManager:CreateParticle("particles/dev/library/base_dust_hit_shockwave.vpcf", PATTACH_RENDERORIGIN_FOLLOW, target)

		ability:ApplyDataDrivenModifier(caster, caster, "modifier_shovel_smack_cooldown_datadriven", {} ) 

		--print("[ Debug ][ dmg_to_deal ]" .. dmg_to_deal )
	end
end