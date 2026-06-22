--// XFusion UI Library
--// Version: 1.0.0
--// By: Reyy + ChatGPT

local XFusion = {}
XFusion.__index = XFusion

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Theme = {
    Background = Color3.fromRGB(22,22,22),
    Secondary = Color3.fromRGB(30,30,30),
    Accent = Color3.fromRGB(0,170,255),
    Text = Color3.fromRGB(255,255,255),
    TextDark = Color3.fromRGB(170,170,170),
    Stroke = Color3.fromRGB(45,45,45),
    Radius = UDim.new(0,10)
}

local function Round(Object)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = Theme.Radius
    Corner.Parent = Object
end

local function Stroke(Object)
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Theme.Stroke
    UIStroke.Thickness = 1
    UIStroke.Parent = Object
end

local function Tween(Object,Time,Properties)
    TweenService:Create(
        Object,
        TweenInfo.new(Time,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
        Properties
    ):Play()
end
