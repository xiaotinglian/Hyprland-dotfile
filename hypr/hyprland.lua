-- Hyprland Lua entrypoint.

local source = debug and debug.getinfo and debug.getinfo(1, "S").source or ""
local baseDir = source:match("^@(.*/)")

if package and baseDir then
    package.path = table.concat({
        baseDir .. "?.lua",
        baseDir .. "?/init.lua",
        package.path,
    }, ";")
end

require("config.animations")
require("config.autostart")
require("config.decorations")
require("config.environment")
require("config.input")
require("config.keybinds")
require("config.monitor")
require("config.variables")
require("config.windowrules")

-- For personal overrides, create config/user.lua and uncomment the line below.
-- require("config.user")
