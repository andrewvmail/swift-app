import SwiftUI

struct WelcomePage: View {

    @EnvironmentObject var appSequence: AppSequence
    @EnvironmentObject var main: Main



    var body: some View {
        VStack {
            Text("Hello, World!")
            Button("Press me") {
                self.appSequence.momoHello2(main: self.main)
            }
        }
    }
}

struct WelcomePage_Previews1: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
