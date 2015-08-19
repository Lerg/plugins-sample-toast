display.setStatusBar(display.HiddenStatusBar)

local widget = require('widget')
local toast = require('plugin.toast')

--[[
toast.show(message, [options])

Shows a toast message.

message - text string to be displayed.

options.duration - display time, possible values are 'short' and 'long'. Short is 2 seconds, long is 3.5 seconds.
    On Android it is system dependent. Default value is 'short'.

options.gravity - a point on the screen, to which the toast message is anchored. Possible values:
    'TopLeft',    'TopCenter',    'TopRight',
    'CenterLeft', 'Center',       'CenterRight',
    'BottomLeft', 'BottomCenter', 'BottomRight'.
    Default is 'BottomCenter'.

options.offset - array, that contains two values: horizontal offset and vertical offset from the anchor point.
    These values are not in pixels, but in device points instead (scales with device screen density).
    Default is {64, 64} or {64, 0} or {0, 64} or {0, 0} depending on the gravity value.

Example:

toast.show('Toast is done!', {duration = 'long', gravity = 'TopCenter', offset = {0, 128}})

]]

display.setDefault('background', 1)

local rect = display.newRect(display.contentCenterX, display.contentCenterY, 200, 100)
rect:setFillColor(0.75)

math.randomseed(os.time())

local toastButton = widget.newButton {
    x = rect.x, y = rect.y,
    width = 150, height = 50,
    label = 'Make a toast!',
    onRelease = function()
        print('Showing a toast')
        local index = math.random(1, 5);
        if index == 1 then
            toast.show('You have just clicked a button')
        elseif index == 2 then
            toast.show('Center toast!', {gravity = 'Center'})
        elseif index == 3 then
            toast.show('Toast is done!', {duration = 'long', gravity = 'TopRight'})
        elseif index == 4 then
            toast.show('Content pixel size is ' .. display.pixelHeight .. 'x' .. display.pixelWidth, {gravity = 'TopLeft', offset = {32, 32}})
        elseif index == 5 then
            toast.show('A very long\nand multiline toast\nmessage.\nLong lines will be wrapped automatically if they do not fit on the screen.')
        end
    end}
