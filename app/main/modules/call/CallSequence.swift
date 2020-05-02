import Foundation
import UIKit

class CallSequence: ObservableObject {
    func addLogs(main: Main) {
        if let randomLogs = main.callState.callList.randomElement() {
            main.callState.callList.append(randomLogs)
        }
    }

    func call(main: Main) {
        main.callState.dialpadInput = ""
    }

    func inputKey(main: Main, key: String) {
        main.callState.dialpadInput = main.callState.dialpadInput + key
    }

    func deleteKey(main: Main) {
        if(!main.callState.dialpadInput.isEmpty) {
            main.callState.dialpadInput.remove(at: main.callState.dialpadInput.index(before: main.callState.dialpadInput.endIndex))
            // ^(modifying)
            // main.callState.dialpadInput = String(main.callState.dialpadInput.dropLast())
            // ^(non-modifying)
        }
    }

}
