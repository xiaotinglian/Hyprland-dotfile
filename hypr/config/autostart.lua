-- Converted from config/autostart.lua

hl.on("hyprland.start", function()
    hl.exec_cmd("vibepanel")
    hl.exec_cmd("fcitx5 -d &")
    hl.exec_cmd("/usr/libexec/kf6/polkit-kde-authentication-agent-1 &")
end)
