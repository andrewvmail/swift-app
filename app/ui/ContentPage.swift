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

    var body: some View {
        Button(action: {
            // self.isPlaying.toggle()
            // print(self.isPlaying)
        }) {
            Image(systemName: true ? "pause.circle" : "play.circle")
        }
    }
}
struct ContentPage: View {
    // var body: some View {
    //     Text("Hello, World!")
    // }
    @State var selection: Int? = nil
    // var isPlaying: Bool
    // var someClass = SomeClass()

    var body: some View {
        NavigationView {
            VStack {
                // PlayButton(isPlaying: )
                NavigationLink(destination: Details(), tag: 1, selection: $selection) {
                    Button("Press me") {
                        self.selection = 1
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

    var body: some View {
        Group {
            Text("Details")
            Button("pop back") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}