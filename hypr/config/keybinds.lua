-- Converted from config/keybinds.lua

local defaults = require("config.defaults")
local mainMod = defaults.mainMod

hl.config({
    binds = {
        allow_workspace_cycles = 1,
        workspace_back_and_forth = 1,
        workspace_center_on = 1,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true,
    },
})

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(defaults.terminal), { desc = "Open terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(defaults.fileManager), { desc = "Open file manager" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { desc = "Close active window" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit(), { desc = "Exit Hyprland" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { desc = "Toggle floating" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill rofi || " .. defaults.appLauncher), { desc = "Application launcher" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { desc = "Toggle fullscreen" })
hl.bind(mainMod .. " + Y", hl.dsp.window.pin({ action = "toggle" }), { desc = "Pin window" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { desc = "Toggle split" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(defaults.browser), { desc = "Open browser" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(defaults.editor), { desc = "Open editor" })

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window --clipboard-only"), { desc = "Screenshot window" })
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"), { desc = "Screenshot selection" })
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"), { desc = "Screenshot output" })

hl.bind(mainMod .. " + K", hl.dsp.group.toggle(), { desc = "Toggle group" })
hl.bind(mainMod .. " + TAB", hl.dsp.group.next(), { desc = "Next in group" })

hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"'), { desc = "Default gaps" })
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"'), { desc = "No gaps" })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100 + 0.5)}' > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%- && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100 + 0.5)}' > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{if($3==\"[MUTED]\") print 0; else print int($2*100 + 0.5)}' > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"), { locked = true, repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { desc = "Play/Pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { desc = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { desc = "Previous track" })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"), { desc = "Lock screen" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("pkill -x vibepanel || true; vibepanel &"), { desc = "Restart panel" })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, desc = "Resize window" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, desc = "Drag window" })

for i = 1, 10 do
    local key = tostring(i % 10)

    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { desc = "Switch workspace " .. i })
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }), { desc = "Move window to workspace " .. i .. " and switch" })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }), { desc = "Move window to workspace " .. i .. " silently" })
end

hl.bind(mainMod .. " + CTRL + left", hl.dsp.exec_raw("movetoworkspace, -1"), { desc = "Move window to next workspace" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.exec_raw("movetoworkspace, +1"), { desc = "Move window to previous workspace" })

hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })
hl.bind(mainMod .. " + COMMA", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { desc = "Scroll next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { desc = "Scroll previous workspace" })
hl.bind(mainMod .. " + slash", hl.dsp.focus({ workspace = "previous" }), { desc = "Last workspace" })

hl.bind(mainMod .. " + minus", hl.dsp.exec_raw("movetoworkspace, special"), { desc = "Move to special workspace" })
hl.bind(mainMod .. " + equal", hl.dsp.workspace.toggle_special("special"), { desc = "Toggle special workspace" })
hl.bind(mainMod .. " + F1", hl.dsp.workspace.toggle_special("scratchpad"), { desc = "Toggle scratchpad" })
hl.bind(mainMod .. " + ALT + SHIFT + F1", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { desc = "Move to scratchpad" })
