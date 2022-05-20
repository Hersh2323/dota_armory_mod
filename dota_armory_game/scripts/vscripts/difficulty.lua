function call_variable()

	local var = c_func_call_combined_difficulty_return_int()
	if var then
		print("[ Debug ] var: " .. var )
	else

		print("[ Debug ] var failed")
	end
end

function abil_increase_additional_difficulty(event)
	local ability = event.ability
	local caster = event.caster

	c_func_increment_additional_difficulty_and_return_updated_int()
end

function abil_reduce_additional_difficulty(event)
	local ability = event.ability
	local caster = event.caster

	c_func_reduce_additional_difficulty_and_return_updated_int()
end