import Foundation
import UIKit

class Main: ObservableObject {
    var appState: AppState = AppState()
    var appSequence = AppSequence()
    var catsState = CatsState()
    var catsSequence = CatsSequence()
    var router = ViewRouter()
    var callState = CallState()
    var callSequence = CallSequence()

    func setToken(appState: AppState) {
        print(appState)
        print(UIApplication.shared.windows.first!.rootViewController)
        print(ModelData())
        print(ModelData().changeName())
    }
    func momoHello() {
        print("momo hello")
    }
}
