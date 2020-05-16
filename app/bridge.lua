local bridge = {}
local Table = require('lua-main.orm.class.table')

bridge.start = function(callback)
    callback("hi")
end


bridge.migrate = function(callback)
    print("start migrate")
    Table("user")
    Table("news")
    Table("weather")
    print("end migrate")
    callback("")
end




return bridge
