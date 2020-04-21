import SwiftUI


import Foundation
import Combine
import SwiftUI

enum Pages {
    case RegistrationPage
    case WelcomePage
    case HelloWorldPage
    case ContentPage
}

class ViewRouter: ObservableObject {

    let objectWillChange = PassthroughSubject<ViewRouter, Never>()

    var currentPage: Pages = Pages.RegistrationPage {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
}

struct RootView: View {

    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        VStack {
            if viewRouter.currentPage == Pages.HelloWorldPage {
                HelloWorldPage()
            } else if viewRouter.currentPage == Pages.WelcomePage {
                WelcomePage()
                        .transition(.scale)
            } else if viewRouter.currentPage == Pages.ContentPage {
                ContentPage()
                        .transition(.scale)
            } else if viewRouter.currentPage == Pages.RegistrationPage {
                RegistrationPage()
                        .transition(.scale)

            }
        }
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(ViewRouter())
    }
}
#endif