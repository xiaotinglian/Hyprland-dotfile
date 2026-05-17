-- Converted from config/windowrules.conf

hl.window_rule({
    name = "tag-chromium-based-browser",
    match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" },
    tag = "+chromium-based-browser",
})

hl.window_rule({
    name = "tag-firefox-based-browser",
    match = { class = "([fF]irefox|zen|librewolf)" },
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
    name = "video-sites-no-opacity",
    match = { initial_title = "((?i)(?:[a-z0-9-]+\\.)*youtube\\.com_/|app\\.zoom\\.us_/wc/home)" },
    opacity = "1.0 1.0",
})

hl.layer_rule({
    name = "hyprshot-selection-no-anim",
    match = { namespace = "selection" },
    no_anim = true,
})

hl.window_rule({ name = "tag-pip", match = { title = "(Picture.?in.?[Pp]icture)" }, tag = "+pip" })
hl.window_rule({ name = "pip-float", match = { tag = "pip" }, float = true })
hl.window_rule({ name = "pip-pin", match = { tag = "pip" }, pin = true })
hl.window_rule({ name = "pip-size", match = { tag = "pip" }, size = "600 338" })
hl.window_rule({ name = "pip-keep-aspect", match = { tag = "pip" }, keep_aspect_ratio = true })
hl.window_rule({ name = "pip-no-border", match = { tag = "pip" }, border_size = 0 })
hl.window_rule({ name = "pip-opacity", match = { tag = "pip" }, opacity = "1 1" })
hl.window_rule({ name = "pip-move", match = { tag = "pip" }, move = "(monitor_w-window_w-40) (monitor_h*0.04)" })

hl.window_rule({ name = "steam-float", match = { class = "steam" }, float = true })
hl.window_rule({ name = "steam-center", match = { class = "steam", title = "Steam" }, center = true })
hl.window_rule({ name = "steam-opacity", match = { class = "steam" }, opacity = "1 1" })
hl.window_rule({ name = "steam-size-main", match = { class = "steam", title = "Steam" }, size = "1100 700" })
hl.window_rule({ name = "steam-size-friends", match = { class = "steam", title = "Friends List" }, size = "460 800" })
hl.window_rule({ name = "steam-idle-inhibit", match = { class = "steam" }, idle_inhibit = "fullscreen" })

hl.window_rule({
    name = "tag-terminal",
    match = { class = "(Alacritty|kitty|com.mitchellh.ghostty)" },
    tag = "+terminal",
})

hl.window_rule({ name = "floating-window-float", match = { tag = "floating-window" }, float = true })
hl.window_rule({ name = "floating-window-center", match = { tag = "floating-window" }, center = true })
hl.window_rule({ name = "floating-window-size", match = { tag = "floating-window" }, size = "875 600" })

hl.window_rule({
    name = "tag-floating-window-main",
    match = { class = "(org.omarchy.bluetui|org.omarchy.impala|org.omarchy.wiremix|org.omarchy.btop|org.omarchy.terminal|org.omarchy.bash|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|Omarchy|About|TUI.float|imv|mpv)" },
    tag = "+floating-window",
})

hl.window_rule({
    name = "tag-floating-window-dialogs",
    match = {
        class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
        title = "^(Open.*Files?|Open [Ff]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to (open|save).*|[Cc]hoose.*)",
    },
    tag = "+floating-window",
})

hl.window_rule({ name = "gnome-calculator-float", match = { class = "org.gnome.Calculator" }, float = true })

hl.window_rule({ name = "screensaver-fullscreen", match = { class = "org.omarchy.screensaver" }, fullscreen = true })
hl.window_rule({ name = "screensaver-float", match = { class = "org.omarchy.screensaver" }, float = true })

hl.window_rule({
    name = "media-no-transparency",
    match = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" },
    opacity = "1 1",
})

hl.window_rule({ name = "pop-rounding", match = { tag = "pop" }, rounding = 8 })
hl.window_rule({ name = "noidle-always", match = { tag = "noidle" }, idle_inhibit = "always" })

hl.window_rule({ name = "webcam-overlay-float", match = { title = "WebcamOverlay" }, float = true })
hl.window_rule({ name = "webcam-overlay-pin", match = { title = "WebcamOverlay" }, pin = true })
hl.window_rule({ name = "webcam-overlay-no-focus", match = { title = "WebcamOverlay" }, no_initial_focus = true })
hl.window_rule({ name = "webcam-overlay-no-dim", match = { title = "WebcamOverlay" }, no_dim = true })
hl.window_rule({ name = "webcam-overlay-move", match = { title = "WebcamOverlay" }, move = "(monitor_w-window_w-40) (monitor_h-window_h-40)" })
