//
//  ContentPage.swift
//  app
//
//  Created by Andrew Tan on 2020-04-15.
//  Copyright © 2020 Andrew Tan. All rights reserved.
//

import SwiftUI
class SomeClass {
    @State public var isPlaying: Bool = true
}
struct PlayButton: View {
    // @Binding var isPlaying: Bool
    @EnvironmentObject var appState: AppState

    var body: some View {
        Button(action: {
            // self.isPlaying.toggle()
            // print(self.isPlaying)
        }) {
            Text(appState.token! ?? "momo")
            Image(systemName: true ? "pause.circle" : "play.circle")
        }
    }
}

class Cat: ObservableObject {
    @Published var myInt = 1
    @Published var name = "hi"
}

struct ContentPage: View {
    // var body: some View {
    //     Text("Hello, World!")
    // }
    @State var selection: Int? = nil
    @EnvironmentObject var order: Cat
    @EnvironmentObject var appState: AppState

    // var isPlaying: Bool
    // var someClass = SomeClass()

    var body: some View {
        NavigationView {
            VStack {
                // PlayButton(isPlaying: )
                NavigationLink(destination: Details(), tag: 1, selection: $selection) {
                    Button("Press me" + order.name) {
                        self.selection = 1
                        self.order.name = "momo"
                        AppSequence().setToken(appState: self.appState)
                    }
                }
            }
        }
    }
}

// struct ContentPage_Previews: PreviewProvider {
//
//     @Binding var isPlaying: Bool
//
//     static var previews: some View {
//         ContentPage(isPlaying: true)
//     }
// }

struct Details: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var main: Main
    @EnvironmentObject var appSequence: AppSequence

    var body: some View {
        Group {
            Text(appState.token ?? "momo")
            Text("Details")
            Button("pop back") {
                self.presentation.wrappedValue.dismiss()
                // self.appSequence.setToken(appState: self.appState)
                self.appSequence.momoHello(main: self.main)
            }
        }
    }
}