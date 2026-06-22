local Window = {}

function Window:CreateWindow(Config)
    Config = Config or {}

    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = Config.Name or "XRR_Window"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 400, 0, 250)
    main.Position = UDim2.new(0.5, -200, 0.5, -125)
    main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    main.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = main

    local topbar = Instance.new("Frame")
    topbar.Size = UDim2.new(1, 0, 0, 35)
    topbar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    topbar.Parent = main

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = Config.Title or "XRR4YTS Window"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.Parent = topbar

    local windowObj = {}

    windowObj.Gui = gui
    windowObj.Frame = main
    windowObj.Title = title

    function windowObj:SetTitle(text)
        title.Text = text
    end

    return windowObj
end

return Window
