import UIKit

class MyApplication: UIApplication {}

let lk = LuaKit()
lk.error();
lk.start();

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(MyApplication.self),
    NSStringFromClass(AppDelegate.self)
)
