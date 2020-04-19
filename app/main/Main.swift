import Foundation
import UIKit

class Main: ObservableObject {
    var appState: AppState = AppState()
    var appSequence = AppSequence()
    var catsState: CatsState = CatsState()
    var catsSequence = CatsSequence()
    var router = ViewRouter()

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
