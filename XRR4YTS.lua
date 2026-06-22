local XRR4YTSLib = {}
XRR4YTSLib.__index = XRR4YTSLib

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
function XRR4YTSLib:CreateWindow(Config)
    Config = Config or {}

    local Title = Config.Title or "XRR4YTSLib"

    if CoreGui:FindFirstChild("XRR4YTSLib") then
        CoreGui.XRR4YTSLib:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "XRR4YTSLib"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 650, 0, 420)
    Main.Position = UDim2.new(0.5, -325, 0.5, -210)
    Main.BackgroundColor3 = Theme.Background
    Main.Parent = ScreenGui
    Round(Main)
    Stroke(Main)

    local Topbar = Instance.new("Frame")
    Topbar.Size = UDim2.new(1,0,0,40)
    Topbar.BackgroundColor3 = Theme.Secondary
    Topbar.Parent = Main
    Round(Topbar)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1,-80,1,0)
    TitleLabel.Position = UDim2.new(0,15,0,0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Text = Title
    TitleLabel.Parent = Topbar

    local Minimize = Instance.new("TextButton")
    Minimize.Size = UDim2.new(0,30,0,30)
    Minimize.Position = UDim2.new(1,-35,0,5)
    Minimize.Text = "-"
    Minimize.Font = Enum.Font.GothamBold
    Minimize.TextColor3 = Theme.Text
    Minimize.BackgroundColor3 = Theme.Background
    Minimize.Parent = Topbar
    Round(Minimize)

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0,170,1,-40)
    Sidebar.Position = UDim2.new(0,0,0,40)
    Sidebar.BackgroundColor3 = Theme.Secondary
    Sidebar.Parent = Main

    local TabList = Instance.new("UIListLayout")
    TabList.Padding = UDim.new(0,6)
    TabList.Parent = Sidebar

    local Pages = Instance.new("Frame")
    Pages.Size = UDim2.new(1,-170,1,-40)
    Pages.Position = UDim2.new(0,170,0,40)
    Pages.BackgroundTransparency = 1
    Pages.Parent = Main

    -- Draggable
    local Dragging = false
    local DragInput
    local DragStart
    local StartPos

    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            DragInput = input
        end
    end)

    RunService.RenderStepped:Connect(function()
        if Dragging and DragInput then
            local Delta = DragInput.Position - DragStart
            Main.Position = UDim2.new(
                StartPos.X.Scale,
                StartPos.X.Offset + Delta.X,
                StartPos.Y.Scale,
                StartPos.Y.Offset + Delta.Y
            )
        end
    end)

    Minimize.MouseButton1Click:Connect(function()
        if Pages.Visible then
            Pages.Visible = false
            Sidebar.Visible = false
            Tween(Main,0.25,{Size = UDim2.new(0,650,0,40)})
        else
            Pages.Visible = true
            Sidebar.Visible = true
            Tween(Main,0.25,{Size = UDim2.new(0,650,0,420)})
        end
    end)

    local Window = {}

local CurrentTab = nil

function Window:CreateTab(Name)
    local Tab = {}

    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1,-10,0,35)
    TabButton.Position = UDim2.new(0,5,0,0)
    TabButton.BackgroundColor3 = Theme.Background
    TabButton.TextColor3 = Theme.Text
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    TabButton.Text = Name
    TabButton.Parent = Sidebar
    Round(TabButton)
    Stroke(TabButton)

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1,0,1,0)
    Page.CanvasSize = UDim2.new(0,0,0,0)
    Page.ScrollBarThickness = 4
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = Pages

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0,8)
    Layout.Parent = Page

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 10)
    end)

    TabButton.MouseButton1Click:Connect(function()
        for _,v in ipairs(Pages:GetChildren()) do
            if v:IsA("ScrollingFrame") then
                v.Visible = false
            end
        end

        Page.Visible = true
        CurrentTab = Page
    end)

    if not CurrentTab then
        CurrentTab = Page
        Page.Visible = true
    end

    Tab.Page = Page

return Tab
end

    return Window
end

return XRR4YTSLib
