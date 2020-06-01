local bridge = {}
local Table = require('lua-main.orm.class.table')
local settingsTable

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
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
    _G.config = config
end

bridge.setConfigIndex = function(configIndex)
    _G.configIndex = configIndex
end

bridge.getConfigByKey = function(key)
    local maybeValue
    for k, v in pairs(_G.configIndex) do
        if v == key then
            maybeValue = _G.config[k]
        end
    end
    return maybeValue
end

bridge.migrate = function(callback)
    settingsTable = Table("settings")
    local record = settingsTable.get:first()
    if (record == nil) then
        bridge.saveSettings("localhost:5080", "abc")
    end
    print("in migrate", dump(_G.config))
    callback("")
end

bridge.getSettings = function()
    return settingsTable.get:all():getPureData()
end

bridge.saveSettings = function(server, token)
    local settings = settingsTable({ id = 0, server = server, token = token })
    settings:save()
end

return bridge
