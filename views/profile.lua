--
-- User: Glastis
-- Date: 15-Nov-19
--

local composer = require 'composer'
local mui = require 'materialui.mui'
local views = require 'views.common'
local utilitie = require 'common.utilities'
local json = require 'common.json'

views.set_active_view(1)

local scene = composer.newScene()

local background
local widget = require( "widget" )
local muiData = require( "materialui.mui-data" )

local scene_group

local progress_error

progress_error = false

local function new_text(text_array)
    local text_size
    local y
    local i

    text_size = 15
    i = 1;
    while i <= #text_array do
        y = display.contentCenterY - ((#text_array/2 - (i - 1)) * (text_size + 2))
        mui.newText({
            y = y,
            x = display.contentCenterX,
            name = tostring(i),
            text = text_array[i],
            align = "center",
            font = native.systemFont,
            fontSize = text_size,
            fillColor = views.get_color_ratio(51, 102, 204),
        })
        i = i + 1
    end
end

local function draw_profile(mui, profile_data)
    local text

    if not profile_data and not profile_data['login'] then
        progress_error = 'Erreur lors de la demande du profil'
        return nil
    end
    profile_data = profile_data.data

    text = {}
    text[#text + 1] = profile_data.login
    text[#text + 1] = 'Credits : ' .. profile_data.credits
    text[#text + 1] = 'Semestre ' .. profile_data.semester_code
    text[#text + 1] = 'GPA : ' .. profile_data.gpa[1].gpa
    text[#text + 1] = 'Epices disponibles : ' .. profile_data.spice.available_spice
    mui.destroyProgressBar('progressbar_demo')
    new_text(text)
    local open_intra = function()
        system.openURL('https://intra.epitech.eu/user/')
    end

    mui.newRoundedRectButton({
        name = "login_submit",
        text = "Voir sur l'intra",
        width = 150,
        height = 30,
        x = display.contentCenterX,
        y = display.contentCenterY - ((#text/2 - (#text + 4 - 1)) * (15 + 2)),
        font = native.systemFont,
        textColor = views.background_color,
        fillColor = views.get_color_ratio(51, 153, 255),
        radius = 10,
        callBack = open_intra
    })
--    views.add_header(mui)
end

local function add_loading_bar()
    local topInset, leftInset, bottomInset, rightInset = mui.getSafeAreaInsets()

    --    local function increaseMyProgressBar()
    --        print("increaseMyProgressBar")
    --        mui.increaseProgressBar("progressbar_demo", 5)
    --    end
    --
    local back_color = views.get_color_ratio(77,77,77)
    local color = views.get_color_ratio(99,99,99)

    local text_loop_i
    local odd

    text_loop_i = 1
    odd = false
    local function swap_colors()
        local tmp

        tmp = back_color
        back_color = color
        color = tmp
    end

    local function get_text(modif)
        local text

        text = {}
        text[#text + 1] = "Le serveur demande a l'intra"
        text[#text + 1] = "L'intra est lent..."
        text[#text + 1] = "Très lent."
        text[#text + 1] = "En moyenne ca dure 16 secondes"
        text[#text + 1] = "Sinon ca va ?"
        text[#text + 1] = "Ca devrait finir bientot"
        text[#text + 1] = "Je suis une loop de texte"
        text[#text + 1] = "Je vaut bien 4 credits, non ?"
        text[#text + 1] = "2/3 millions de requetes faites"
        text[#text + 1] = "Pain au chocolat ou chocolatine ?"

        if modif then
            if text_loop_i > #text then
                text_loop_i = 1
            else
                text_loop_i = text_loop_i + 1
            end
        end
        return text[text_loop_i]
    end

    local function reset_progress_bar()
        swap_colors()

        if not progress_error then
            mui.setProgressBarProperty('progressbar_demo', {
                foregroundColor = back_color,
                backgroundColor = color,
                labelText = get_text(odd)
            })
        else
            mui.setProgressBarProperty('progressbar_demo', {
                foregroundColor = views.get_color_ratio(153, 0, 0),
                backgroundColor = views.get_color_ratio(153, 0, 0),
                labelText = progress_error,
                percentComplete = 0
            })
        end
        odd = not odd
    end

    mui.newProgressBar({
        name = "progressbar_demo",
        width = 290,
        height = 8,
        x = display.contentCenterX - (290/2),
        y = display.contentCenterY,
        foregroundColor = back_color,
        backgroundColor = color,
        startPercent = 100,
        barType = "determinate",
        iterations = 1000,
        labelText = get_text(),
        labelFont = native.systemFont,
        labelFontSize = 18,
        labelColor = {  0.4, 0.4, 0.4, 1 },
        labelAlign = "center",
        callBack = reset_progress_bar,
        hideBackdropWhenDone = true
    })
end

local function get_profile_callback(event)
    if event.isError then
        print("Network error: ", event.response)
        draw_profile(mui, nil)
    else
        print("RESPONSE: " .. event.response)
        draw_profile(mui, json.parse(event.response))
    end
end

local function get_profile()
    local token
    local params

    token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQ0MjU5MGVlMmQzYzI4YjJkODU4OTlmODA0ZTg3ZDQ5ZGQzYTYyZmZiYmQyNTAzM2Q3ZDg0NmE5NDhmZTM3Zjc4ZjY0YzRmM2QxNDBlNjhiIn0.eyJhdWQiOiI1IiwianRpIjoiNDQyNTkwZWUyZDNjMjhiMmQ4NTg5OWY4MDRlODdkNDlkZDNhNjJmZmJiZDI1MDMzZDdkODQ2YTk0OGZlMzdmNzhmNjRjNGYzZDE0MGU2OGIiLCJpYXQiOjE1NzQ2MTg5NjAsIm5iZiI6MTU3NDYxODk2MCwiZXhwIjoxNjA2MjQxMzU5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.A2mWVxc_bZcSOv5AnY_vA2p_cakcjB-p6mqkXkii0aSOzBfMybae0_voG2aJrE7XaXoSNLw4zzXk1n0gnyoCrOLjJPHfSvybsN_Ijm23hZhSkIpAXqvSC_DdJ_V9am-7Un_ea-5z311pwiBnQ4bUZP2cXLssIA4OAv_8Ryh3VB_dnFQQCtV0pP_maiAlHdExevM1OS6ad5dp5PGsaZb0FCyaK1-E5CY_LRoD8b1QJi7HgbsrAOV9brS0BttksGWn2-_0npY--c7aLfwNQ48x3CQPmSWOv-qr6Q5sx5KhMxyK-v54Fw5hhAP6vvXLOBQiOJ7aWGsJ1BKVsMPQrnf7DNOj4uTfIYlOhI41oHyvhg5LZY9koa11wyxtLfCp1OW1R6kS00sSNKFSqiVjtcHS6RtUmy9fwQoxUwdMr-JlGMj1sY-va2dttLwpCkjAF6gLIZyH7xFk-TxREBwBL9VdQ0H4uDfSl6uYD5M1HMp2dFXEvkNj01zYom7EaPN3VrPluY5PZHVr2eCDp4y5L-ZEP_sMnJ259GmtgvHvwj_iK06yGLXyhIgOwAamh_M0uxmqYpKyQz6vuChhkKD9S7R6OSLJf9jWhxJk5y5z6G-649NCucuZSQl3qleyu3s6fI8q0IGHG8m2KvRe1yXo-fZv_qYpJ0o9aHI3sH1dbT_sCa0'
    params = {}
    params.headers = {}
    params.headers["Content-Type"] = "application/json"
    params.headers["Accept"] = "application/json"
    params.headers["Authorization"] = "Bearer " .. token
    --    network.request("https://google.com", "GET", get_modules_callback, params)
    network.request("https://new.glastis.com/api/epitech/user", "GET", get_profile_callback, params)
end


function scene:create(event)
    local sceneGroup = self.view

    scene_group = sceneGroup
    mui.init()
    views.create_background(mui, sceneGroup)
    views.add_header(mui)
    get_profile()
    add_loading_bar()
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
    mui.removeEmbossedText('1')
    mui.removeEmbossedText('2')
    mui.removeEmbossedText('3')
    mui.removeEmbossedText('4')
    mui.removeEmbossedText('5')
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