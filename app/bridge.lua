local bridge = {}
local Table = require('lua-main.orm.class.table')
local settingsTable

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

bridge.start = function(callback)
    callback("hi")
end

bridge.setConfig = function(config)
    print("config", config)
    print(dump(config))
end

bridge.setConfigIndex = function(configIndex)
    print("setConfig", configIndex)
    print(dump(configIndex))
end

bridge.migrate = function(callback)
    settingsTable = Table("settings")
    local record = settingsTable.get:first()
    if(record == nil) then
        bridge.saveSettings("localhost:5080", "abc" )
    end
    callback("")
end

bridge.getSettings = function ()
    return settingsTable.get:all():getPureData()
end

bridge.saveSettings = function (server, token)
    local settings = settingsTable({ id = 0, server = server, token = token })
    settings:save()
end

return bridge
