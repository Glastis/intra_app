-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

_mui_debug = true

local composer = require "composer"

composer.gotoScene("views.login")
--composer.gotoScene("menu_old")