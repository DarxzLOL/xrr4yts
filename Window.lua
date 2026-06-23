local Window = {}

function Window:CreateWindow(Config)
	Config = Config or {}

	local player = game.Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	local gui = Instance.new("ScreenGui")
	gui.Name = Config.Name or "XRR4YTS"
	gui.ResetOnSpawn = false
	gui.IgnoreGuiInset = true
	gui.Parent = playerGui

	local frame = Instance.new("Frame")
	frame.Name = "Main"
	frame.Size = UDim2.new(0, 400, 0, 250)
	frame.Position = UDim2.new(0.5, -200, 0.5, -125)
	frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	frame.BorderSizePixel = 0
	frame.Parent = gui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = frame

	local topBar = Instance.new("Frame")
	topBar.Name = "TopBar"
	topBar.Size = UDim2.new(1, 0, 0, 40)
	topBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	topBar.BorderSizePixel = 0
	topBar.Parent = frame

	local topCorner = Instance.new("UICorner")
	topCorner.CornerRadius = UDim.new(0, 10)
	topCorner.Parent = topBar

	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.Size = UDim2.new(0, 24, 0, 24)
	icon.Position = UDim2.new(0, 10, 0.5, -12)
	icon.BackgroundTransparency = 1
	icon.Image = Config.Icon or "rbxassetid://78248938971512"
	icon.Parent = topBar

	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.Size = UDim2.new(1, -50, 1, 0)
	title.Position = UDim2.new(0, 42, 0, 0)
	title.BackgroundTransparency = 1
	title.Text = Config.Title or "XRR UI"
	title.TextColor3 = Color3.fromRGB(255,255,255)
	title.TextSize = 18
	title.Font = Enum.Font.GothamBold
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = topBar

	local container = Instance.new("Frame")
	container.Name = "Container"
	container.Size = UDim2.new(1, -10, 1, -50)
	container.Position = UDim2.new(0, 5, 0, 45)
	container.BackgroundTransparency = 1
	container.Parent = frame

	return {
		Gui = gui,
		Frame = frame,
		Container = container,
		TopBar = topBar
	}
end

return Window
