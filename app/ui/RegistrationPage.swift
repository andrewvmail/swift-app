import SwiftUI

struct RegistrationPage: View {
    @State var selection: Int? = nil
    @EnvironmentObject var order: Cat
    @EnvironmentObject var appState: AppState
    @State var phoneNumber: String = ""
    @EnvironmentObject var main: Main
    @EnvironmentObject var appSequence: AppSequence

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("Phone number:")
                            .font(.callout)
                            .bold()
                    TextField("Enter phone number...", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)

                    // Hi

                }.padding()

                Button(action: {
                    self.appSequence.route(
                            main: self.main,
                            route: Pages.WelcomePage)
                }) {
                    Text("Submit")
                }.padding()

                Spacer()
            }.padding()
        }.modifier(DismissingKeyboard())
    }
}

