-- Author: iGottic

--[=[
    @class Value
    @since 1.0.0
]=]

local Value = {}

--[=[
    Creates a new value object. Enforces type checking based on initial value type.

    @param Value any -- The initial value
    @return {Value : any} -- The value object
]=]

function Value:__call(Value : any)
    local AttachedObjects = {}

    local ActiveValue = setmetatable({}, {
        __index = function(self, Index : string)
            if Index == "__SPHI_OBJECT" then
                return "Value"
            elseif Index == "Value" then
                return Value
            end
        end,

        __newindex = function(self, Index : string, NewValue : any)
            if Index == "Value" and typeof(NewValue) == typeof(Value)  then
                Value = NewValue

                for _, AttachedObject in AttachedObjects do -- Update all attached objects
                    if not AttachedObject[1]:IsDescendantOf(game) then
                        table.remove(AttachedObjects, table.find(AttachedObjects, AttachedObject))
                        continue
                    end

                    AttachedObject[1][AttachedObject[2]] = NewValue
                end
            else
                error("Invalid value type! Expected " .. typeof(Value) .. ", got " .. typeof(NewValue))
            end
        end,

        __call = function(self, Object, Index : string)
            table.insert(AttachedObjects, {
                Object, Index
            })

            Object[Index] = Value
        end
    })

    return ActiveValue
end

-- function Value:__index(Index : string)
--     if Index == "__SPHI_OBJECT" then
--         return "Value"
--     else
--         return nil
--     end
-- end

return setmetatable({}, Value)