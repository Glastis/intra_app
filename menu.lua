-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require 'composer'
local mui = require 'materialui.mui'
local views = require 'views.common'
local utilitie = require 'common.utilities'

local scene = composer.newScene()

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

local background = nil
local widget = require( "widget" )

-- mui
local muiData = require( "materialui.mui-data" )

function scene:create(event)
    local sceneGroup = self.view

    mui.init()

    -- Gather insets (function returns these in the order of top, left, bottom, right)
    local topInset, leftInset, bottomInset, rightInset = mui.getSafeAreaInsets()

    -- Create a vector rectangle sized exactly to the "safe area"
    local background = display.newRect(
        display.screenOriginX + leftInset,
        display.screenOriginY + topInset,
        display.contentWidth - (leftInset + rightInset),
        display.contentHeight - (topInset + bottomInset)
    )
    background:setFillColor(1)
    background:translate(background.width*0.5, background.height*0.5)
    sceneGroup:insert(background)

    views.add_header(mui)

    mui.newTableView({
        parent = mui.getParent(),
        name = "tableview",
        width = 180,
        height = 100,
        top = 10,
        left = muiData.safeAreaWidth - 190,
        font = native.systemFont,
        fontSize = 8,
        textColor = { 0, 0, 0, 1 },
        lineColor = { 1, 1, 1, 1 },
        lineHeight = 2,
        rowColor = {1, 1, 1, 1}, --{ default={1,1,1}, over={1,0.5,0,0.2} },
        rowHeight = 20,
        -- rowAnimation = false, -- turn on rowAnimation
        noLines = false,
        callBackTouch = mui.onRowTouchDemo,
        callBackRender = mui.onRowRenderDemo,
        scrollListener = mui.scrollListener,  -- needed if using buttons, etc within the row!
        list = { -- if 'key' use it for 'id' in the table row
            { key = "Row1", text = "Row 1", value = "1", isCategory = false, valign = "middle" },
            { key = "Row2", text = "Row 2", value = "2", isCategory = false, valign = "middle" },
            { key = "Row3", text = "Row 3", value = "3", isCategory = false, valign = "middle" },
            { key = "Row4", text = "Row 4", value = "4", isCategory = false },
            { key = "Row5", text = "Row 5", value = "5", fontSize = 8, isCategory = false, columns = {
                { text = "Row 5C1", value = "5A", align = "left", valign = "top" },
                { text = "Row 5C2", value = "5B", align = "left", valign = "middle" },
                { text = "Row 5C3", value = "5C", align = "left", valign = "bottom" },
            },
            },
            { key = "Row6", text = "Row 6", value = "6", fontSize = 8, isCategory = false, columns = {
                { text = "Row 6 Col 1", value = "6A", align = "center" },
                { text = "Row 6 Col 2", value = "6B", align = "center" },
                { text = "Row 6 Col 3", value = "6C", align = "center" },
            },
            },
            { key = "Row7", text = "Row 7", value = "7", fontSize = 8, isCategory = false, columns = {
                { text = "Row 7 Col 1", value = "7A", align = "right" },
                { text = "Row 7 Col 2", value = "7B", align = "right" },
                { text = "Row 7 Col 3", value = "7C", align = "right" },
            },
            },
            { key = "Row8", text = "Row 8", value = "8", isCategory = false, fillColor = { 0, 0, 1, 0.2 }, valign = "top" },
            -- below are rows with different colors
            -- set "noLines" to true above to omit line border
            { key = "Row5", text = "Row 5", value = "5", isCategory = false, fillColor = { 0.67, 0.98, 0.65, 0.2 } },
            { key = "Row6", text = "Row 6", value = "6", isCategory = false, fillColor = { 1, 0, 0, 0.2 }  },
        },
        columnOptions = {
            widths = { 60, 60, 60 }, -- must supply each else "auto" is assumed.
        },
        categoryColor = { default={0.8,0.8,0.8,0.8} },
        categoryLineColor = { 1, 1, 1, 0 },
        touchpointColor = { 0.4, 0.4, 0.4 },
    })
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