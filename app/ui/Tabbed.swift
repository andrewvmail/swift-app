import SwiftUI

struct TabbedContentView: View {
    var body: some View {
        TabView {
            CallLogsView()
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("First Tab")
                    }

            BlueView()
                    .tabItem {
                        Image(systemName: "tv.fill")
                        Text("Second Tab")
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