--
-- User: Glastis
-- Date: 15-Nov-19
--

local composer = require 'composer'
local mui = require 'materialui.mui'
local views = require 'views.common'
local utilitie = require 'common.utilities'

views.set_active_view(1)

local scene = composer.newScene()

local background
local widget = require( "widget" )
local muiData = require( "materialui.mui-data" )

function scene:create(event)
    local sceneGroup = self.view

    mui.init()
    views.create_background(mui, sceneGroup)
    views.add_header(mui)

end

function scene:show(event)

    local sceneGroup
    local phase

    sceneGroup = self.view
    phase = event.phase
    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
        -- mui.actionSwitchScene({callBackData={sceneDestination="fun"}})
    end
end

function scene:hide(event)

    local sceneGroup
    local phase

    sceneGroup = self.view
    phase = event.phase
    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end

function scene:destroy( event )

    local sceneGroup

    sceneGroup = self.view
    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
    mui.destroy()

    if background ~= nil then
        background:removeSelf()
        background = nil
    end
    sceneGroup:removeSelf()
    sceneGroup = nil

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene