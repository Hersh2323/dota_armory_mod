lua_model_size_gathering_node_herb_modifier_buff = class({})

function lua_model_size_gathering_node_herb_modifier_buff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MODEL_SCALE,
		MODIFIER_PROPERTY_MODEL_CHANGE
	}

	return funcs
end

function lua_model_size_gathering_node_herb_modifier_buff:GetModifierModelScale()
	local scale = self:GetAbility():GetSpecialValueFor( "active_node_modelscale" )

	return scale
end


function lua_model_size_gathering_node_herb_modifier_buff:IsHidden() 
	return true
end

function lua_model_size_gathering_node_herb_modifier_buff:GetModifierModelChange()
	return "models/items/hex/sheep_hex/sheep_hex.vmdl"
end

