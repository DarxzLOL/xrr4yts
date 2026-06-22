local Window = {}

function Window:CreateWindow(Config)
    Config = Config or {}

    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    print("[XRR] Init Window")

    local gui = Instance.new("ScreenGui")
    gui.Name = Config.Name or "XRR_UI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 250)
    frame.Position = UDim2.new(0.5, -200, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    frame.BorderSizePixel = 0
    frame.Visible = true
    frame.Parent = gui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 35)
    title.BackgroundTransparency = 1
    title.Text = Config.Title or "XRR UI"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Parent = frame

    print("[XRR] Frame created")

    return {
        Gui = gui,
        Frame = frame
    }
end

return Window
