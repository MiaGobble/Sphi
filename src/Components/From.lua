-- Author: iGottic

--[=[
    @class From
    @since 1.0.0
]=]

local From = {}

-- Imports
local Modules = script.Parent.Parent.Modules
local ComponentsManager = require(Modules.ComponentsManager)

--[=[
    Used within New, this function is used to hydrate an existing component with given properties.

    @param ComponentName string -- The name of the component to hydrate
    @param ... any -- The optional arguments to pass to the component constructor
]=]

function From:__call(ComponentName : string, ... : any)
    local Component = ComponentsManager:GetComponent(ComponentName)

    if not Component then
        error("Component does not exist!")
    end

    return {
        __SEAM_OBJECT = "From",
        Component = Component,
        Args = {...}
    }
end

function From:__index(Key : string)
    if Key == "__SEAM_CAN_BE_SCOPED" then
        return false
    end

    return nil
end

return setmetatable({}, From)