import SwiftUI

struct DialPad: View {
    var body: some View {
        VStack {
            
            VStack(alignment: .center) {
                Spacer()
                Text("Hamlet").font(.title)
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
            
        }) {
            Image(systemName: "phone").dialerButtonStyle()
        }
    }
    
    func createDeleteButton() -> some View {
            Button(action: {
                
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
        return Button(action: {
            
        }) {
            Text(text)
                .dialerButtonStyle()
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

private extension View {
    func dialerButtonStyle() -> some View {
        modifier(DialerButtonViewModifier())
    }
}

struct DialPad_Previews: PreviewProvider {
    struct DialPad_Harness: View {
        
        var body: some View {
            DialPad()
        }
    }
    
    static var previews: some View {
        DialPad_Harness()
    }
}
