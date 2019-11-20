--
-- User: Glastis
-- Date: 15-Nov-19
--

local composer = require 'composer'
local mui = require 'materialui.mui'
local views = require 'views.common'
local utilitie = require 'common.utilities'

local widget = require 'widget'
local muiData = require 'materialui.mui-data'

views.set_active_view(3)

local background
local scene = composer.newScene()

local pass
local data

local function network_callback(event)
    if (event.isError) then
        print("Network error: ", event.response)
    else
        print("RESPONSE: " .. event.response)
    end
end

local function get_token(email, pass)
    local headers

    headers = {}
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    network.request("https://new.glastis.com/auth/token", "POST", network_callback)
end

local function email_callback(data)
    local muiTargetValue = mui.getEventParameter(data, "muiTargetValue")

    utilitie.var_dump(muiTargetValue, true, 10)
    utilitie.var_dump(data, true, 20)
end

local function pass_callback(data)

end

function scene:create(event)
    local sceneGroup = self.view

    mui.init()

    local topInset, leftInset, bottomInset, rightInset = mui.getSafeAreaInsets()

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
    mui.newTextField({
        parent = mui.getParent(),
        name = "login_user",
        labelText = "",
        placeholder = "Courriel",
        font = native.systemFont,
        width = 200,
        height = 26,
        x = (display.contentWidth - (leftInset + rightInset)) / 2,
        y = (display.contentHeight - (topInset + bottomInset)) / 2 - 40,
        trimAtLength = 30,
        activeColor = { 0, 0, 0, 1 },
        inactiveColor = { 0.5, 0.5, 0.5, 1 },
        callBack = mui.textfieldCallBack
    })

    mui.newTextField({
        parent = mui.getParent(),
        name = "login_pass",
        labelText = "",
        placeholder = "Mot de passe",
        text = "",
        font = native.systemFont,
        width = 200,
        height = 26,
        x = (display.contentWidth - (leftInset + rightInset)) / 2,
        y = (display.contentHeight - (topInset + bottomInset)) / 2 + 10,
        activeColor = { 0, 0, 0, 1 },
        inactiveColor = { 0.5, 0.5, 0.5, 1 },
        callBack = email_callback
    })

    local showToast = function()
        mui.newToast({
            name = "login_status",
            text = "Connexion en cours",
            radius = 20,
            width = 200,
            height = 30,
            font = native.systemFont,
            fontSize = 18,
            fillColor = { 0, 0, 0, 1 },
            textColor = { 1, 1, 1, 1 },
            top = 40 + muiData.safeAreaInsets.topInset,
            easingIn = 500,
            easingOut = 500,
            callBack = pass_callback
        })
        get_token()
    end

    mui.newRoundedRectButton({
        name = "login_submit",
        text = "Connexion",
        width = 100,
        height = 30,
        x = (display.contentWidth - (leftInset + rightInset)) / 2,
        y = (display.contentHeight - (topInset + bottomInset)) / 2 + 80,
        font = native.systemFont,
        textColor = { 1, 1, 1, 1 },
        fillColor = { 0.63, 0.81, 0.181 },
        radius = 10,
        callBack = showToast
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
