local Window = {}

function Window:CreateWindow(Config)
    Config = Config or {}

    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = Config.Name or "UI"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 200)
    frame.Position = UDim2.new(0.5, -175, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = Config.Title or "Window"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.Parent = frame

    local windowObj = {}
    windowObj.Gui = gui
    windowObj.Frame = frame
    windowObj.Title = title

    return windowObj
end

return Window
