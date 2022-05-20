lua_model_size_modifier_buff = class({})

function lua_model_size_modifier_buff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MODEL_SCALE,
	}

	return funcs
end

function lua_model_size_modifier_buff:GetModifierModelScale()
	local scale = self:GetAbility():GetSpecialValueFor( "bonus_model_scale" )

	return scale
end


function lua_model_size_modifier_buff:IsHidden() 
	return true
end

lua_giants_toe_buff = class({})

function lua_giants_toe_buff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MODEL_SCALE,
	}

	return funcs
end

function lua_giants_toe_buff:GetModifierModelScale()
	local scale = self:GetAbility():GetSpecialValueFor( "bonus_model_scale" )

	return scale
end


function lua_giants_toe_buff:IsHidden() 
	return true
end


lua_fleas_knees_buff = class({})

function lua_fleas_knees_buff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MODEL_SCALE,
	}

	return funcs
end

function lua_fleas_knees_buff:GetModifierModelScale()
	local scale = self:GetAbility():GetSpecialValueFor( "bonus_model_scale" )

	return scale
end


function lua_fleas_knees_buff:IsHidden() 
	return true
end

