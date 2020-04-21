import Foundation
import UIKit

class AppSequence: ObservableObject {
    func setToken(appState: AppState) {
        print(appState)
        print(UIApplication.shared.windows.first!.rootViewController)
        print(ModelData())
        print(ModelData().changeName())
    }

    func momoHello(main: Main) {
        print("momo hello")
        main.appState.token = "MOMO TERRAW!!!"
        main.router.currentPage = Pages.WelcomePage
    }

    func momoHello2(main: Main) {
        print("momo hello")
        main.appState.token = "MOMO TERRAWdddd!!!"
        main.router.currentPage = Pages.HelloWorldPage
    }

    func route(main: Main, route: Pages) {
        main.router.currentPage = route
    }
}

import UIKit

class ModelData: NSObject, ObservableObject {
    static let shared: ModelData = ModelData()
    var name = "Fred"
    var age = 50

    func changeName() {
        name = "momo"
    }

}