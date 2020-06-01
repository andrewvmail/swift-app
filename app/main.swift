import UIKit

class MyApplication: UIApplication {}

let lk = LuaKit()
lk.error();
lk.start();

let configIndex = ["name", "last_name"]
let config = ["momo", "tanner"]

LuaBridge.setConfig(config)
LuaBridge.setConfigIndex(configIndex)

LuaBridge.migrate { (result) -> () in }

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(MyApplication.self),
    NSStringFromClass(AppDelegate.self)
)
