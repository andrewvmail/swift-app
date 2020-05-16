import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var callState: CallState
    @State private var name: String = "momo"
    @State private var enableAirplaneMode = false
    var notificationMode = ["Lock Screen", "Notification Centre", "Banners"]
    @State private var selectedMode = 0

    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("Call Settings")){
                    TextField("Server", text: self.$appState.server)
                    TextField("Token", text: self.$appState.token)
                    // Toggle(isOn: $enableAirplaneMode) {
                    //     Text("Airplane Mode")
                    // }
                    //
                    // Picker(selection: $selectedMode, label: Text("Notifications")) {
                    //     ForEach(0..<notificationMode.count) {
                    //         Text(self.notificationMode[$0])
                    //     }
                    // }
                }

                // Section(header: Text("About")) {
                //     HStack {
                //         Text("Name")
                //         Spacer()
                //         Text("iPhone 11")
                //     }
                //
                //     HStack {
                //         Text("Software Version")
                //         Spacer()
                //         Text("13.1.1")
                //     }
                // }
            } .navigationBarTitle("Settings")
        }
    }
}
