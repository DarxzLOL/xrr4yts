local Mobile = {}

local UIS = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

function Mobile.Setup(Window)
	if not Window then
		return
	end

	local function Update()
		local Size = workspace.CurrentCamera.ViewportSize

		if UIS.TouchEnabled and not UIS.KeyboardEnabled then
			Window.Size = UDim2.new(0.9,0,0.75,0)
		elseif UIS.TouchEnabled then
			Window.Size = UDim2.new(0.75,0,0.7,0)
		else
			Window.Size = UDim2.new(0,650,0,420)
		end

		local Inset = GuiService:GetGuiInset()

		Window.Position = UDim2.new(
			0.5,
			-Window.AbsoluteSize.X/2,
			0,
			math.max(30, Inset.Y + 10)
		)
	end

	Update()

	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Update)
end

local Mobile = require(script.Parent.Mobile)
Mobile.Setup(Main)

return Mobile
