--[=[
    The main framework module for Seam.
    @class Seam
]=]

local Seam = {}

-- Variables
local States = script.States

--[=[
    @prop New New
    @within Seam
]=]

Seam.New = require(States.New)
Seam.new = Seam.New

--[=[
    @prop Children Children
    @within Seam
]=]

Seam.Children = require(States.Children)
Seam.children = Seam.Children

--[=[
    @prop Value Value
    @within Seam
]=]

Seam.Value = require(States.Value)
Seam.value = Seam.Value

--[=[
    @prop Computed Computed
    @within Seam
]=]

Seam.Computed = require(States.Computed)
Seam.computed = Seam.Computed

--[=[
    @prop Spring Spring
    @within Seam
]=]

Seam.Spring = require(States.Animation.Spring)
Seam.spring = Seam.Spring

--[=[
    @prop Tween Tween
    @within Seam
]=]

Seam.Tween = require(States.Animation.Tween)
Seam.tween = Seam.Tween

--[=[
    @prop Scope Scope
    @within Seam
]=]

Seam.Scope = require(States.Scope)
Seam.scope = Seam.Scope

--[=[
    @prop OnEvent OnEvent
    @within Seam
]=]

Seam.OnEvent = require(States.OnEvent)
Seam.onEvent = Seam.OnEvent

--[=[
    @prop OnChange OnChanged
    @within Seam
]=]

Seam.OnChanged = require(States.OnChanged)
Seam.onChanged = Seam.OnChanged

--[=[
    @prop DeclareComponent DeclareComponent
    @within Seam
]=]

Seam.DeclareComponent = require(States.DeclareComponent)
Seam.declareComponent = Seam.DeclareComponent

--[=[
    @prop From From
    @within Seam
]=]

Seam.From = require(States.From)
Seam.from = Seam.From

return Seam