local Lib = {}

Lib.Theme = require(script.Theme)
Lib.Utility = require(script.Utility)
Lib.Window = require(script.Window)
Lib.Tab = require(script.Tab)
Lib.Button = require(script.Button)
Lib.Toggle = require(script.Toggle)
Lib.Slider = require(script.Slider)
Lib.Dropdown = require(script.Dropdown)
Lib.Textbox = require(script.Textbox)
Lib.Label = require(script.Label)
Lib.Paragraph = require(script.Paragraph)
Lib.Keybind = require(script.Keybind)
Lib.Notification = require(script.Notification)
Lib.Mobile = require(script.Mobile)

-- Fitur Tambahan
Lib.Draggable = require(script.Draggable)
Lib.Minimize = require(script.Minimize)
Lib.Resize = require(script.Resize)
Lib.Ripple = require(script.Ripple)
Lib.Search = require(script.Search)
Lib.Blur = require(script.Blur)
Lib.Icons = require(script.Icons)

function Lib:Init()
	local Window = self.Window:CreateWindow({
		Title = "XRR4YTS Hub",
		Name = "Main"
	})

	self._Window = Window
	return Window
end

function Lib:MakeDraggable(Frame)
	return self.Draggable.Setup(Frame)
end

function Lib:MakeMinimize(Button, Window)
	return self.Minimize.Setup(Button, Window)
end

function Lib:MakeResizable(Window)
	return self.Resize.Setup(Window)
end

function Lib:Ripple(Button)
	return self.Ripple.Setup(Button)
end

function Lib:EnableSearch(SearchBox, Container)
	return self.Search.Setup(SearchBox, Container)
end

function Lib:EnableBlur(Enabled)
	return self.Blur.Setup(Enabled)
end

function Lib:SetIcon(Object, IconName)
	return self.Icons.Set(Object, IconName)
end

return Lib
