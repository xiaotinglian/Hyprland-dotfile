-- Hyprland Lua entrypoint.
-- Modules mirror the old split .conf files under config/.

local source = debug and debug.getinfo and debug.getinfo(1, "S").source or ""
local baseDir = source:match("^@(.*/)")

if package and baseDir then
    package.path = table.concat({
        baseDir .. "?.lua",
        baseDir .. "?/init.lua",
        package.path,
    }, ";")
end

local function import(module)
    local ok, result = pcall(require, module)
    if ok then
        return result
    end

    if not baseDir then
        error(result)
    end

    local path = baseDir .. module:gsub("%.", "/") .. ".lua"
    local chunk, loadErr = loadfile(path)
    if not chunk then
        error(loadErr)
    end

    return chunk()
end

for _, module in ipairs({
    "config.animations",
    "config.autostart",
    "config.decorations",
    "config.environment",
    "config.input",
    "config.keybinds",
    "config.monitor",
    "config.variables",
    "config.windowrules",
}) do
    import(module)
end

-- For personal overrides, create config/user.lua and uncomment the line below.
-- import("config.user")
