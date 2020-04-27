import Foundation
import UIKit

class CallSequence: ObservableObject {
    func addLogs(main: Main) {
        if let randomLogs = main.callState.callList.randomElement() {
            main.callState.callList.append(randomLogs)
        }
    }
    func call(main: Main) {
        print("call")
    }

}
