import SwiftUI

struct CountryPickerPage: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var main: Main
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search countries")
                List {
                    ForEach(self.main.callState.countries.countryWithCode.filter {
                        self.searchText.isEmpty ? true : $0.countryName.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { countries in
                        Button(action: {
                            self.main.callState.selectedCountryCode = countries.countryCode
                            self.main.callState.selectedCountryName = countries.countryName
                            self.presentation.wrappedValue.dismiss()
                        }) {
                            Text(countries.countryName)
                        }
                    }
                }.navigationBarTitle(Text("Countries"))
                        .navigationBarItems(leading:
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                        })


            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct CountryPickerPage_Previews: PreviewProvider {
    static var previews: some View {
        CountryPickerPage()
    }
}
