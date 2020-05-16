local bridge = {}
local Table = require('lua-main.orm.class.table')
local settingsTable

bridge.start = function(callback)
    callback("hi")
end

bridge.migrate = function(callback)
    settingsTable = Table("settings")
    local settings = settingsTable({ id = 0, server = "localhost:5080", token = "abc" })
    settings:save()
    callback("123")
end

bridge.getSettings = function ()
    return settingsTable.get:all():getPureData()
end

return bridge
