-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

_mui_debug = true

local composer = require "composer"

composer.gotoScene("views.modules")
--composer.gotoScene("views.profile")
--composer.gotoScene("menu_old")