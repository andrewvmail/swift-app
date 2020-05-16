import Foundation

class AppState: ObservableObject {
    @Published var token = (LuaBridge.getSettings()![0] as AnyObject).object(forKey: "token") as! String
    @Published var server = (LuaBridge.getSettings()![0] as AnyObject).object(forKey: "server") as! String
}

