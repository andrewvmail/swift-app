import SwiftUI

let numToAbc = ["1": "", "2": "ABC", "3": "DEF",
                "4": "GHI", "5": "JKL", "6":"MNO",
                "7":"PQRS", "8": "TUV","9":"WXYZ",
                "*": "", "0":"+", "#":""]

struct DialPad: View {
    @EnvironmentObject var callState: CallState
    @EnvironmentObject var main: Main
    @EnvironmentObject var callSequence: CallSequence

    var body: some View {
        VStack {
            
            VStack(alignment: .center) {
                Spacer()
                HStack(alignment: .center) {
                    Text("Select a country ∨").font(.subheadline).padding()
                    Spacer()
                    Text("100 Credits").font(.subheadline).padding()
                }
                Spacer()
                Text(self.callState.dialpadInput).font(.title).frame(height: 10)
                Spacer()
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                ForEach(0..<3) { row in
                    HStack(spacing: 20) {
                        ForEach(0..<3) { column in
                            self.createDialerButton(row: row, column: column)
                        }
                    }
                }
                HStack(spacing: 20) {
                    self.createDialerButton(row: 3, column: 8) // * star
                    self.createDialerButton(row: 3, column: 0)
                    self.createDialerButton(row: 3, column: 1) // # pound
                }
            }
            Spacer()
            
            VStack(alignment: .center) {
                Spacer()
                HStack( spacing: 20) {
                    self.createPhoneButton().zIndex(1).opacity(0)
                    self.createPhoneButton().zIndex(1)
                    self.createDeleteButton().zIndex(1)
                }
                Spacer()
            }
        }
    }
    
    func createPhoneButton() -> some View {
        Button(action: {
           self.callSequence.call(main: self.main)
        }) {
            Image(systemName: "phone").dialerButtonStyle()
        }
    }
    
    func createDeleteButton() -> some View {
        Button(action: {
           self.callSequence.deleteKey(main: self.main)
        }) {
            Image(systemName: "delete.left.fill")
                .resizable()
                .padding(25)
                .frame(height:80)
                .dialerButtonStyle()
        }
    }
    
    func createDialerButton(row: Int, column: Int) -> some View {
        let index = row * 3 + column
        var text = "\(index == 9 ? 0 : index + 1)"
        if(index == 18 - 1) {
            text = "*"
        }
        if(index == 11 - 1) {
            text = "#"
        }
        let abc = "\(numToAbc[text] ?? "")"
        return Button(action: {
           self.callSequence.inputKey(main: self.main, key: text)
        }) {
            VStack {
                Text(text).dialerButtonStyle()
                Text(abc).dialerButtonStyleAbc()
            }
        }
    }
}

private struct DialerButtonViewModifier: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(Font.custom("Helvetica Neue", size: 50).weight(.thin))
            .foregroundColor(.black)
            .frame(width: 80)
    }
}
private struct DialerButtonAbcViewModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(Font.custom("Helvetica Neue", size: 12).weight(.semibold))
            .foregroundColor(.black)
            .frame(width: 40)
    }
}
private extension View {
    func dialerButtonStyle() -> some View {
        modifier(DialerButtonViewModifier())
    }
    func dialerButtonStyleAbc() -> some View {
        modifier(DialerButtonAbcViewModifier())
    }
}

struct DialPad_Previews: PreviewProvider {
    
    struct DialPad_Harness: View {
        
        var body: some View {
            DialPad()
            .environmentObject(Main())
            .environmentObject(CallState())
            .environmentObject(CallSequence())
        }
    }
    
    static var previews: some View {
        DialPad_Harness()
    }
}
