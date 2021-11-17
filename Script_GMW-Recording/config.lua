---@diagnostic disable: undefined-global, trailing-space

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print(filename()..".lua gestartet");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Config
-- ════════════════════════════════════════════════════════════════════════════════════ --

Config = {}

Config.SetKeyBind   = true      -- false to disable
Config.KeyBind      = 170       -- F3

Config.SetCommand   = true      -- false to disable
Config.Command      = "rec"        