import SwiftUI

struct RegistrationPage: View {
    @State var selection: Int? = nil
    @EnvironmentObject var order: Cat
    @EnvironmentObject var appState: AppState
    @State var phoneNumber: String = ""

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


                }.padding()

                Button(action: {}) {
                    Text("Submit")
                }.padding()

                Spacer()
            }.padding()
        }.modifier(DismissingKeyboard())
    }
}

