import SwiftUI


import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {

    let objectWillChange = PassthroughSubject<ViewRouter, Never>()

    var currentPage: String = "ContentPage" {
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
            if viewRouter.currentPage == "HelloWorldPage" {
                HelloWorldPage()
            } else if viewRouter.currentPage == "WelcomePage" {
                WelcomePage()
                        .transition(.scale)
            } else if viewRouter.currentPage == "ContentPage" {
                ContentPage()
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