-- Converted from config/windowrules.lua

local chromiumBrowserClass = "^((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge(-stable)?|Vivaldi-stable|helium)$"
local firefoxBrowserClass = "^([fF]irefox|zen|librewolf)$"
local pipBrowserClass = "^((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge(-stable)?|Vivaldi-stable|helium|[fF]irefox|zen|librewolf)$"
local pipTitle = "^(?i)picture[ -]?in[ -]?picture$"
local floatingDialogTitle = "^(Open.*Files?|Open [Ff]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to (open|save).*|[Cc]hoose.*)$"

hl.window_rule({
    name = "tag-chromium-based-browser",
    match = { class = chromiumBrowserClass },
    tag = "+chromium-based-browser",
})

hl.window_rule({
    name = "tag-firefox-based-browser",
    match = { class = firefoxBrowserClass },
    tag = "+firefox-based-browser",
})

hl.window_rule({
    name = "tile-chromium-based-browser",
    match = { tag = "chromium-based-browser" },
    tile = true,
})

hl.window_rule({
    name = "opacity-chromium",
    match = { tag = "chromium-based-browser" },
    opacity = "1 0.97",
})

hl.window_rule({
    name = "opacity-firefox",
    match = { tag = "firefox-based-browser" },
    opacity = "1 0.97",
})

hl.window_rule({
    name = "browser-media-no-opacity",
    match = {
        class = pipBrowserClass,
        title = "^(?i).*(youtube|twitch|zoom|google meet).*$",
    },
    opacity = "1.0 1.0",
})

hl.layer_rule({
    name = "hyprshot-selection-no-anim",
    match = { namespace = "selection" },
    no_anim = true,
})

hl.window_rule({ name = "tag-pip-title", match = { class = pipBrowserClass, title = pipTitle }, tag = "+pip" })
hl.window_rule({ name = "tag-pip-initial-title", match = { class = pipBrowserClass, initial_title = pipTitle }, tag = "+pip" })
hl.window_rule({ name = "pip-float", match = { tag = "pip" }, float = true })
hl.window_rule({ name = "pip-pin", match = { tag = "pip" }, pin = true })
hl.window_rule({ name = "pip-size", match = { tag = "pip" }, size = "600 338" })
hl.window_rule({ name = "pip-keep-aspect", match = { tag = "pip" }, keep_aspect_ratio = true })
hl.window_rule({ name = "pip-no-border", match = { tag = "pip" }, border_size = 0 })
hl.window_rule({ name = "pip-opacity", match = { tag = "pip" }, opacity = "1 1" })
hl.window_rule({ name = "pip-move", match = { tag = "pip" }, move = "(monitor_w-window_w-40) (monitor_h*0.04)" })

hl.window_rule({ name = "steam-float", match = { class = "^steam$" }, float = true })
hl.window_rule({ name = "steam-center", match = { class = "^steam$", title = "^Steam$" }, center = true })
hl.window_rule({ name = "steam-opacity", match = { class = "^steam$" }, opacity = "1 1" })
hl.window_rule({ name = "steam-size-main", match = { class = "^steam$", title = "^Steam$" }, size = "1100 700" })
hl.window_rule({ name = "steam-size-friends", match = { class = "^steam$", title = "^Friends List$" }, size = "460 800" })
hl.window_rule({ name = "steam-idle-inhibit", match = { class = "^steam$" }, idle_inhibit = "fullscreen" })

hl.window_rule({ name = "discord-float", match = { class = "^(discord|Discord)$" }, float = true })

hl.window_rule({
    name = "tag-terminal",
    match = { class = "^(Alacritty|kitty|ghostty|com.mitchellh.ghostty)$" },
    tag = "+terminal",
})

hl.window_rule({ name = "floating-window-float", match = { tag = "floating-window" }, float = true })
hl.window_rule({ name = "floating-window-center", match = { tag = "floating-window" }, center = true })
hl.window_rule({ name = "floating-window-size", match = { tag = "floating-window" }, size = "875 600" })

hl.window_rule({
    name = "tag-floating-window-main",
    match = { class = "^(org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|imv|mpv)$" },
    tag = "+floating-window",
})

hl.window_rule({
    name = "tag-current-app-dialogs",
    match = {
        class = "^(code|microsoft-edge)$",
        title = floatingDialogTitle,
    },
    tag = "+floating-window",
})

hl.window_rule({
    name = "tag-floating-window-dialogs",
    match = {
        class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
        title = floatingDialogTitle,
    },
    tag = "+floating-window",
})

hl.window_rule({ name = "gnome-calculator-float", match = { class = "org.gnome.Calculator" }, float = true })

hl.window_rule({
    name = "media-no-transparency",
    match = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" },
    opacity = "1 1",
})

hl.window_rule({ name = "webcam-overlay-float", match = { title = "^WebcamOverlay$" }, float = true })
hl.window_rule({ name = "webcam-overlay-pin", match = { title = "^WebcamOverlay$" }, pin = true })
hl.window_rule({ name = "webcam-overlay-no-focus", match = { title = "^WebcamOverlay$" }, no_initial_focus = true })
hl.window_rule({ name = "webcam-overlay-no-dim", match = { title = "^WebcamOverlay$" }, no_dim = true })
hl.window_rule({ name = "webcam-overlay-move", match = { title = "^WebcamOverlay$" }, move = "(monitor_w-window_w-40) (monitor_h-window_h-40)" })

hl.window_rule({
    { class = "^steam_app_.*$", }, -- Applies rules to Proton games
    {
        no_gaps_when_only = 2,
        allow_tearing = true, -- Great for tearing-capable GPUs
        no_blur = true,
        focus_on_close = 1,
    }
})

hl.window_rule({
    { class = "^steam$", title = "^Steam$" }, -- Steam client itself
    {
        float = true,
        move = "cursor 0 0",
        size = "1000 700"
    }
})
