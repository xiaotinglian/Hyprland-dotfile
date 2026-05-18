-- Converted from config/autostart.lua

hl.on("hyprland.start", function()
    hl.exec_cmd("vibepanel")
    hl.exec_cmd("ibus start --type wayland")
    hl.exec_cmd("/usr/libexec/hyprpolkitagent &")
end)
