function get_current_combined_difficulty()
	local level_difficulty = GLOBAL_VARIABLE_CURRENT_HERO_LEVEL
	local bonus_difficulty = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL

	if level_difficulty and bonus_difficulty then
		local combined_difficulty = level_difficulty + bonus_difficulty
	end

	return combined_difficulty
end

function increment_difficulty()
	local level_difficulty = GLOBAL_VARIABLE_CURRENT_HERO_LEVEL
	local bonus_difficulty = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL

	if level_difficulty and bonus_difficulty then
		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL+1
		get_current_combined_difficulty()
	end
end

function decrease_difficulty()
	local level_difficulty = GLOBAL_VARIABLE_CURRENT_HERO_LEVEL
	local bonus_difficulty = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL

	if level_difficulty and bonus_difficulty then
		GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL-1

		if not GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL-1 == 0  then
			get_current_combined_difficulty()
		end
	end
end

function level_up()

end



-- this function is no longer used
function kill_level_up_exp_gain(event)
	local caster = event.caster
	local ability = event.ability
	local target = event.target

	local exp_per_kill = ability:GetLevelSpecialValueFor("exp_per_kill", 0)
	local exp_variance = ability:GetLevelSpecialValueFor("exp_variance", 0)


    local exp_per_kill_min = exp_per_kill-exp_variance
    local exp_per_kill_max = exp_per_kill+exp_variance

    local exp_per_kill_roll = RandomInt(exp_per_kill_min, exp_per_kill_max)
    --print("Exp per kill granted: " .. exp_per_kill_roll)


    local current_level = caster:GetLevel()

    if current_level < MAX_LEVEL then

	    target:AddExperience(exp_per_kill_roll, 0, false, true)
	    target:AddExperience(exp_per_kill_roll, 1, false, true)
	    target:AddExperience(exp_per_kill_roll, 2, false, true)
	    target:AddExperience(exp_per_kill_roll, 3, false, true)
	    target:AddExperience(exp_per_kill_roll, 4, false, true)
	    target:AddExperience(exp_per_kill_roll, 5, false, true)
	    target:AddExperience(exp_per_kill_roll, 6, false, true)


    	print("[ EXPERIENCE SYSTEM ]" .. target:GetUnitName() .. " Has gained " ..  exp_per_kill_roll .. " experience.")
    else
    	print("[ EXPERIENCE SYSTEM ][ hero cannot gain experience ][ Unit currently at MAX_LEVEL: " .. MAX_LEVEL .. "]")

    end
    --print("[ EXPERIENCE SYSTEM ][ hero currently at " .. current_level .. " ]")
    --print("[ EXPERIENCE SYSTEM ][ hero currently at MAX_LEVEL: " .. MAX_LEVEL .. "]")


end










function GainCustomExp(event)
	local caster = event.caster
	local ability = event.ability
	local exp_per_kill = ability:GetLevelSpecialValueFor("exp_per_kill", 0) 


	local current_level = caster:GetLevel()
	local current_exp_req_to_level = c_func_get_exp_required_for_this_level(current_level)

	if ability.current_exp then 
		if current_exp_req_to_level then
			--print("[Debug][EXP SYSTEM][Exp at time of kill " .. ability.current_exp .. "][ Exp with kill bonus applied: ".. ability.current_exp+exp_per_kill .." ][ Current EXP total required to level: " .. current_exp_req_to_level .. " ]" )
			ability.current_exp = ability.current_exp+exp_per_kill

			if ability.current_exp >= current_exp_req_to_level then

				ability.current_exp = 0
				caster:HeroLevelUp(true)
			else

			end
		else
		end

	else 
		ability.current_exp = 0 	
		GainCustomExp(event)
	end


end

