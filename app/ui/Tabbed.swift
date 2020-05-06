import SwiftUI

struct TabbedContentView: View {
    var body: some View {
        TabView {
            DialPad()
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("Keypad")
                    }

            // CallLogsView()
            //         .tabItem {
            //             Image(systemName: "tv.fill")
            //             // Text("Second Tab")
            //         }

            SettingsPage()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
        }
    }
}

struct RedView: View {
    var body: some View {
        Color.red
    }
}

struct BlueView: View {
    var body: some View {
        Color.blue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedContentView()
    }
}