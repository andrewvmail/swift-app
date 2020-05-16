import UIKit

class MyApplication: UIApplication {}

let lk = LuaKit()
lk.error();
lk.start();

let lb = LuaBridge();
lb.migrate { (result) -> () in
    // do stuff with the result
    print("--")
    print(result)
    print("--")
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(MyApplication.self),
    NSStringFromClass(AppDelegate.self)
)
