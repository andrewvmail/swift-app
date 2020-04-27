import SwiftUI

struct CallLogsView: View {
    @EnvironmentObject var callState: CallState
    @EnvironmentObject var main: Main
    @EnvironmentObject var appSequence: AppSequence
    @State private var selectedCall: Int?

    func addLogs() {
        CallSequence().addLogs(main: self.main)
    }

    func call() {
        CallSequence().call(main: self.main)
    }

    var body: some View {
        NavigationView {
            List(callState.callList) { call in
                Button(action: self.call) {
                    HStack {
                        Text(call.name)
                        Text(call.type).foregroundColor(call.color)
                    }
                }
            }
                    .navigationBarTitle(Text("Logs"))
                    .navigationBarItems(
                            trailing: Button(action: addLogs, label: { Text("Add") })
                    )
        }
    }
}