import Foundation
import SwiftUI

struct Logs: Identifiable {
    let id: Int
    let name: String
    let type: String
    let color: Color
}

class CallState: ObservableObject {
    @Published var dialpadInput = ""
    @Published var callList = [
        Logs(id: 0, name: "Charmander", type: "Fire", color: .red),
        Logs(id: 1, name: "Squirtle", type: "Water", color: .blue),
        Logs(id: 2, name: "Bulbasaur", type: "Grass", color: .green),
        Logs(id: 3, name: "Pikachu", type: "Electric", color: .yellow),
    ]
}