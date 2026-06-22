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

local Lib = {}

Lib.Window = require(script.Window)

function Lib:Init()
    local Window = self.Window:CreateWindow({
        Title = "XRR4YTS UI",
        Name = "XRR_Main"
    })

    self._Window = Window
    return Window
end

return Lib
