--[[
    AUTHOR: tristin30
    DATE: 01/25/2023
    FILE: game.ReplicatedStorage/Repository/Metatable.lua
]]

--SERVICES--
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--VARIABLES--
local Mathicator = {}
local Funcs = {}

Funcs.__index = Funcs
--FUNCTIONS--

function Mathicator:Init()
	self = setmetatable({},Funcs)
	
	self.Operation = nil
	self.Result = 0
	
    return self
end

function Funcs:Addition(Num: number, Num2: number)
    self.Index1 = Num or 0
    self.Index2 = Num2 or 0

	self.Result = self.Index1 + self.Index2
	self.Operation = "Addition"
end

function Funcs:Multiply(Num: number, Num2: number)
	self.Index1 = Num or 0
	self.Index2 = Num2 or 0

	self.Result = self.Index1 * self.Index2
	self.Operation = "Multiplication"
end

function Funcs:Divide(Num: number, Num2: number)
	self.Index1 = Num or 0
	self.Index2 = Num2 or 0

	self.Result = self.Index1 / self.Index2
	self.Operation = "Division"
end

function Funcs:PositiveNegate(Num: number, Num2: number)
	self.Index1 = Num or 0
	self.Index2 = Num2 or 0

    self.Result = 0

    if self.Index1 > self.Index2 then
        self.Result = self.Index1 - self.Index2
    else
        self.Result = self.Index2 - self.Index1
	end
	
	self.Operation = "Positively Negating"
end

function Funcs:Negate(Num: number, Num2: number)
	self.Index1 = Num or 0
	self.Index2 = Num2 or 0
    
	self.Result = self.Index1 - self.Index2
	self.Operation = "Negating"
end

function Funcs:Sqrt(Num: number)
    self.Index = Num or 0
    
	self.Result = math.sqrt(self.index)
	self.Operation = "Squarerooting"
end

function Funcs:Average(Num: number, Num2: number)
	self.Index1 = Num or 0
	self.Index2 = Num2 or 0

	self.Result = math.min(self.Index2)/math.max(self.Index1)
	self.Operation = "Average"
end

function Funcs:Round(Num: number)
    self.Index = Num or 0
    
	self.Result = math.round(self.Index)
	self.Operation = "Round"
end

--EVENTS--

--AUTO_RUN--
return Mathicator
