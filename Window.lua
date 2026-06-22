local Window = {}

function Window:CreateWindow(Config)
    Config = Config or {}

    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = Config.Name or "XRR_UI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    gui.Parent = playerGui

    -- Main Frame (VISIBLE CORE)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 420, 0, 260)
    frame.Position = UDim2.new(0.5, -210, 0.5, -130)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.Visible = true
    frame.ZIndex = 10
    frame.Parent = gui

    -- Corner
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    -- Topbar
    local topbar = Instance.new("Frame")
    topbar.Size = UDim2.new(1, 0, 0, 35)
    topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    topbar.BorderSizePixel = 0
    topbar.Parent = frame

    local topCorner = Instance.new("UICorner")
    topCorner.CornerRadius = UDim.new(0, 10)
    topCorner.Parent = topbar

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -10, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = Config.Title or "XRR UI"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topbar

    -- Content area
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, -35)
    content.Position = UDim2.new(0, 0, 0, 35)
    content.BackgroundTransparency = 1
    content.Parent = frame

    -- DEBUG (WAJIB CEK)
    print("[XRR4YTS] Window spawned successfully")

    -- OBJECT RETURN
    local window = {}
    window.Gui = gui
    window.Frame = frame
    window.Content = content
    window.Tabs = {}

    return window
end

return Window
