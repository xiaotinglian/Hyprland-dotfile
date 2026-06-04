-- Converted from config/monitor.lua

hl.monitor({ output = "DP-4", mode = "5120x1440@120", position = "0x0", scale = "1" })
hl.monitor({ output = "HDMI-A-3", mode = "3440x1440@99.98", position = "840x-1440", scale = "1" })

-- hl.workspace_rule({ workspace = "1", monitor = "DP-4", persistent = true })

-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1" })

-- hl.on("hyprland.start", function()
--     hl.exec_cmd("hyprctl dispatch focusmonitor DP-4")
-- end)
