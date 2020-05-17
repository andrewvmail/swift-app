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
                Section(header: Text("Call Settings")) {
                    TextField("Server", text: self.$appState.server)
                    TextField("Token", text: self.$appState.token)
                }
                Button(action: {
                    LuaBridge.saveSettings(
                        String(self.$appState.server.wrappedValue),
                        token: String(self.$appState.token.wrappedValue))
                }) {
                    Text("Save changes")
                }
            }.navigationBarTitle("Settings")
        }
    }
}
