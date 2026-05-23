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

local function bind_dispatch(keys, dispatcher, opts)
    hl.bind(keys, dispatcher, opts)
end

local function bind_exec(keys, cmd, opts)
    bind_dispatch(keys, hl.dsp.exec_cmd(cmd), opts)
end

local function bind_raw(keys, raw, opts)
    bind_dispatch(keys, hl.dsp.exec_raw(raw), opts)
end

bind_exec(mainMod .. " + RETURN", defaults.terminal, { desc = "Open terminal" })
bind_exec(mainMod .. " + E", defaults.fileManager, { desc = "Open file manager" })
bind_dispatch(mainMod .. " + Q", hl.dsp.window.close(), { desc = "Close active window" })
bind_dispatch(mainMod .. " + SHIFT + M", hl.dsp.exit(), { desc = "Exit Hyprland" })
bind_dispatch(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { desc = "Toggle floating" })
bind_exec(mainMod .. " + ALT", "pkill rofi || " .. defaults.appLauncher, { desc = "Application launcher" })
bind_dispatch(mainMod .. " + F", hl.dsp.window.fullscreen(), { desc = "Toggle fullscreen" })
bind_dispatch(mainMod .. " + Y", hl.dsp.window.pin({ action = "toggle" }), { desc = "Pin window" })
bind_dispatch(mainMod .. " + J", hl.dsp.layout("togglesplit"), { desc = "Toggle split" })
bind_exec(mainMod .. " + B", defaults.browser, { desc = "Open browser" })
bind_exec(mainMod .. " + C", defaults.editor, { desc = "Open editor" })

bind_exec(mainMod .. " + PRINT", "hyprshot -m window --clipboard-only", { desc = "Screenshot window" })
bind_exec("PRINT", "hyprshot -m region --clipboard-only", { desc = "Screenshot selection" })
bind_exec("SHIFT + PRINT", "hyprshot -m output --clipboard-only", { desc = "Screenshot output" })

bind_dispatch(mainMod .. " + K", hl.dsp.group.toggle(), { desc = "Toggle group" })
bind_dispatch(mainMod .. " + TAB", hl.dsp.group.next(), { desc = "Next in group" })

bind_exec(mainMod .. " + SHIFT + G", 'hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"', { desc = "Default gaps" })
bind_exec(mainMod .. " + G", 'hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"', { desc = "No gaps" })

bind_exec("XF86AudioRaiseVolume", "pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob", { locked = true, repeating = true })
bind_exec("XF86AudioLowerVolume", "pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob", { locked = true, repeating = true })
bind_exec("XF86AudioMute", "amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob", { locked = true, repeating = true })

bind_exec("XF86AudioPlay", "playerctl play-pause", { desc = "Play/Pause" })
bind_exec("XF86AudioNext", "playerctl next", { desc = "Next track" })
bind_exec("XF86AudioPrev", "playerctl previous", { desc = "Previous track" })

bind_exec("XF86MonBrightnessUp", "brightnessctl s +5%", { locked = true, repeating = true })
bind_exec("XF86MonBrightnessDown", "brightnessctl s 5%-", { locked = true, repeating = true })
bind_exec(mainMod .. " + L", "hyprlock", { desc = "Lock screen" })
bind_exec(mainMod .. " + O", "pkill -x vibepanel || true; vibepanel &", { desc = "Restart panel" })

bind_raw(mainMod .. " + SHIFT + left", "movewindow l", { desc = "Move window left" })
bind_raw(mainMod .. " + SHIFT + right", "movewindow r", { desc = "Move window right" })
bind_raw(mainMod .. " + SHIFT + up", "movewindow u", { desc = "Move window up" })
bind_raw(mainMod .. " + SHIFT + down", "movewindow d", { desc = "Move window down" })

bind_dispatch(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { desc = "Focus left" })
bind_dispatch(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { desc = "Focus right" })
bind_dispatch(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { desc = "Focus up" })
bind_dispatch(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { desc = "Focus down" })

bind_dispatch(mainMod .. " + R", hl.dsp.submap("resize"), { desc = "Resize mode" })

hl.define_submap("resize", "reset", function()
    bind_raw("right", "resizeactive 15 0", { desc = "Resize right" })
    bind_raw("left", "resizeactive -15 0", { desc = "Resize left" })
    bind_raw("up", "resizeactive 0 -15", { desc = "Resize up" })
    bind_raw("down", "resizeactive 0 15", { desc = "Resize down" })
    bind_raw("l", "resizeactive 15 0", { desc = "Resize right" })
    bind_raw("h", "resizeactive -15 0", { desc = "Resize left" })
    bind_raw("k", "resizeactive 0 -15", { desc = "Resize up" })
    bind_raw("j", "resizeactive 0 15", { desc = "Resize down" })
    bind_dispatch("escape", hl.dsp.submap("reset"), { desc = "Exit resize mode" })
end)

bind_raw(mainMod .. " + CTRL + SHIFT + right", "resizeactive 15 0", { desc = "Resize right" })
bind_raw(mainMod .. " + CTRL + SHIFT + left", "resizeactive -15 0", { desc = "Resize left" })
bind_raw(mainMod .. " + CTRL + SHIFT + up", "resizeactive 0 -15", { desc = "Resize up" })
bind_raw(mainMod .. " + CTRL + SHIFT + down", "resizeactive 0 15", { desc = "Resize down" })
bind_raw(mainMod .. " + CTRL + SHIFT + l", "resizeactive 15 0", { desc = "Resize right" })
bind_raw(mainMod .. " + CTRL + SHIFT + h", "resizeactive -15 0", { desc = "Resize left" })
bind_raw(mainMod .. " + CTRL + SHIFT + k", "resizeactive 0 -15", { desc = "Resize up" })
bind_raw(mainMod .. " + CTRL + SHIFT + j", "resizeactive 0 15", { desc = "Resize down" })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, desc = "Resize window" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, desc = "Drag window" })

for i = 1, 10 do
    local key = tostring(i % 10)

    bind_dispatch(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { desc = "Switch workspace " .. i })
    bind_dispatch(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }), { desc = "Move window to workspace " .. i .. " and switch" })
    bind_dispatch(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }), { desc = "Move window to workspace " .. i .. " silently" })
end

bind_raw(mainMod .. " + CTRL + left", "movetoworkspace -1", { desc = "Move window to next workspace" })
bind_raw(mainMod .. " + CTRL + right", "movetoworkspace +1", { desc = "Move window to previous workspace" })

bind_dispatch(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })
bind_dispatch(mainMod .. " + COMMA", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })
bind_dispatch(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { desc = "Scroll next workspace" })
bind_dispatch(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { desc = "Scroll previous workspace" })
bind_dispatch(mainMod .. " + slash", hl.dsp.focus({ workspace = "previous" }), { desc = "Last workspace" })

bind_raw(mainMod .. " + minus", "movetoworkspace special", { desc = "Move to special workspace" })
bind_dispatch(mainMod .. " + equal", hl.dsp.workspace.toggle_special("special"), { desc = "Toggle special workspace" })
bind_dispatch(mainMod .. " + F1", hl.dsp.workspace.toggle_special("scratchpad"), { desc = "Toggle scratchpad" })
bind_dispatch(mainMod .. " + ALT + SHIFT + F1", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { desc = "Move to scratchpad" })
