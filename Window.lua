local Window = {}

function Window:CreateWindow(Config)
    Config = Config or {}

    local player = game.Players.LocalPlayer

    local gui = Instance.new("ScreenGui")
    gui.Name = Config.Name or "XRR_UI"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 250)
    frame.Position = UDim2.new(0.5, -200, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.Parent = gui

    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, 0, 35)
    top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    top.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = Config.Title or "XRR UI"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.Parent = top

    -- container tab content
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, -35)
    content.Position = UDim2.new(0, 0, 0, 35)
    content.BackgroundTransparency = 1
    content.Parent = frame

    local window = {}
    window.Gui = gui
    window.Frame = frame
    window.Content = content
    window.Tabs = {}

    return window
end

function Window:CreateTab(window, name)
    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
    tabFrame.Parent = window.Content

    local tab = {}
    tab.Name = name
    tab.Frame = tabFrame

    table.insert(window.Tabs, tab)

    function tab:Show()
        for _, t in pairs(window.Tabs) do
            t.Frame.Visible = false
        end
        tabFrame.Visible = true
    end

    function tab:CreateButton(text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 200, 0, 35)
        btn.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren() * 40)
        btn.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 14
        btn.Parent = tabFrame

        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        btn.MouseButton1Click:Connect(function()
            if callback then
                callback()
            end
        end)
    end

    return tab
end

return Window
