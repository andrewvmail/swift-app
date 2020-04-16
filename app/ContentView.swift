//
//  ContentView.swift
//  app
//
//  Created by Andrew Tan on 2020-04-15.
//  Copyright © 2020 Andrew Tan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // var body: some View {
    //     Text("Hello, World!")
    // }
    @State var selection: Int? = nil

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Details(), tag: 1, selection: $selection) {
                    Button("Press me") {
                        self.selection = 1
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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