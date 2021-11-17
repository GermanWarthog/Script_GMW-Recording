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
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

local recording = false 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Config.SetKeyBind == true then 
            if IsControlJustPressed(0, Config.KeyBind) and GetLastInputMethod(0) then 
                if recording == false then 
                    StartRecording(1)
                    recording = true 
                elseif recording == true then 
                    StopRecordingAndSaveClip()
                    recording = false
                end
            end
        end 
    end
end)

RegisterCommand(Config.Command, function(source)
    if recording == false then 
        StartRecording(1)
        recording = true 
    elseif recording == true then 
        StopRecordingAndSaveClip()
        recording = false
    end
end)