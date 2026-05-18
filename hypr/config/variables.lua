-- Converted from config/variables.lua

local colors = require("config.colors")

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 3,
        layout = "dwindle",
        col = {
            active_border = colors.lgreen,
            inactive_border = colors.mblue,
        },
        snap = {
            enabled = true,
        },
    },

    group = {
        col = {
            border_active = colors.dgreen,
            border_inactive = colors.lgreen,
            border_locked_active = colors.mgreen,
            border_locked_inactive = colors.dblue,
        },
        groupbar = {
            font_family = "JetBrainsMono NF",
            text_color = colors.dblue,
            col = {
                active = colors.dgreen,
                inactive = colors.lgreen,
                locked_active = colors.mgreen,
                locked_inactive = colors.dblue,
            },
        },
    },

    misc = {
        font_family = "JetBrainsMono NF",
        splash_font_family = "JetBrainsMono NF",
        disable_hyprland_logo = true,
        col = {
            splash = colors.lgreen,
        },
        background_color = colors.dblue,
        enable_swallow = true,
        swallow_regex = "^(firefox|nautilus|nemo|thunar|btrfs-assistant)$",
        focus_on_activate = true,
        vrr = 2,
    },

    render = {
        direct_scanout = true,
    },

    dwindle = {
        special_scale_factor = 0.8,
        preserve_split = true,
    },

    master = {
        new_status = "master",
        special_scale_factor = 0.8,
    },
})
