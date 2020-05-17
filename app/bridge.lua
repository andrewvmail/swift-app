local bridge = {}
local Table = require('lua-main.orm.class.table')
local settingsTable

bridge.start = function(callback)
    callback("hi")
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
