--
-- User: Glastis
-- Date: 15-Nov-19
--

local utilitie = require 'common.utilities'
local composer = require "composer"

local views = {}

views.LIST = {}
views.LIST[#views.LIST + 1] = { key = "Mon profil", value = #views.LIST + 1, icon="home", labelText="Mon profil", isActive = true, sceneName = "views.profile" }
views.LIST[#views.LIST + 1] = { key = "Liste des modules", value = #views.LIST + 1, icon="view_list", labelText="Liste des modules", isActive = false, sceneName = "views.modules" }
views.LIST[#views.LIST + 1] = { key = "Connexion/Déconnexion", value = #views.LIST + 1, icon="new_releases", labelText="Connexion/Déconnexion", isActive = false, sceneName = "views.login" }

local function set_active_view(id)
    local i

    i = 1
    while views.LIST[i] do
        views.LIST[i].isActive = false
        i = i + 1
    end
    views.LIST[id].isActive = true
end
views.set_active_view = set_active_view

local function get_active_view()
    local i

    i = 1
    while views.LIST[i] do
        if views.LIST[i].isActive then
            return i
        end
        i = i + 1
    end
    return nil
end
views.get_active_view = get_active_view

local function get_color_ratio(r, g, b)
    return { r/255, g/255, b/255 }
end
views.get_color_ratio = get_color_ratio

views.background_color = get_color_ratio(44, 44, 44)

local function menu_callback(data)
    local mui

    if not views.LIST[data.index].isActive then
        mui = data.callBackData
        mui.actionSwitchScene({callBackData={
            sceneDestination=views.LIST[data.index].sceneName,
            titleBackgroundColor = get_color_ratio(51, 153, 255),
        }})
    end
end

local function add_header(mui, search, refresh)
    local showSlidePanel2 = function(event)
        mui.newSlidePanel({
            name = "slidepanel-demo2",
            title = "Epitool",
            titleAlign = "center",
            font = native.systemFont,
            width = 250,
            titleFontSize = 18,
            titleFontColor = views.background_color,
            titleFont = native.systemFont,
            titleBackgroundColor = get_color_ratio(51, 153, 255),
            fontSize = 18,
            fillColor = views.background_color, -- background color
            buttonToAnimate = "menu",
            callBack = menu_callback,
            callBackData = mui,
--            labelColor = { 0.34, 0.81, 0.181 }, -- active
            labelColor = get_color_ratio(51, 153, 255),
            labelColorOff = { 0.5, 0.5, 0.5, 1 }, -- non-active
            buttonHeight = 36, -- fontSize * 2
            buttonHighlightColor = { 0.5, 0.5, 0.5 },
            buttonHighlightColorAlpha = 0.5,
            touchpoint = true,
            list = views.LIST,
        })
    end

    mui.newNavbar({
        name = "navbar_demo",
        --width = mui.getScaleVal(500), -- defaults to display.contentWidth
        height = 40,
        left = 0,
        top = 0,
        fillColor = get_color_ratio(51, 145, 255),
        activeTextColor = views.background_color,
        padding = 5,
    })
    mui.newIconButton({
        name = "menu",
        text = "menu",
        width = 25,
        height = 25,
        x = 0,
        y = 0,
        font = mui.materialFont,
        textColor = views.background_color,
        textAlign = "center",
        callBack = showSlidePanel2
    })
    mui.attachToNavBar( "navbar_demo", {
        widgetName = "menu",
        widgetType = "IconButton",
        align = "left",  -- left | right supported
    })
    if refresh then
        mui.newIconButton({
            name = "refresh",
            text = "refresh",
            width = 25,
            height = 25,
            x = 0,
            y = 0,
            font = mui.materialFont,
            textColor = views.background_color,
            textAlign = "center",
            callBack = mui.actionForButton
        })
        mui.attachToNavBar( "navbar_demo", {
            widgetName = "refresh",
            widgetType = "IconButton",
            align = "left",  -- left | right supported
        })
    end
    if search then
        mui.newTextField({
            name = "textfield_nav",
            text = "",
            placeholder = "Search",
            font = native.systemFont,
            width = 200,
            height = 30,
            x = 0,
            y = 0,
            activeColor = views.background_color,
            inactiveColor = { 1, 1, 1, 0.8 },
            fillColor = { 0.63, 0.81, 0.181 },
            callBack = mui.textfieldCallBack
        })
        mui.attachToNavBar( "navbar_demo", {
            widgetName = "textfield_nav",
            widgetType = "TextField",
            align = "left",  -- left | right supported
        })
    end
end
views.add_header = add_header

local function get_color_merge_rgb(rgb)
    return (rgb[1] + rgb[2] + rgb[3]) / 3
end

local function create_background(mui, sceneGroup)
    local topInset, leftInset, bottomInset, rightInset = mui.getSafeAreaInsets()

    local background = display.newRect(
        display.screenOriginX + leftInset,
        display.screenOriginY + topInset,
        display.contentWidth - (leftInset + rightInset),
        display.contentHeight - (topInset + bottomInset)
    )
    background:setFillColor(get_color_merge_rgb(views.background_color))
    background:translate(background.width*0.5, background.height*0.5)
    sceneGroup:insert(background)
end
views.create_background = create_background

return views

