

// Paste버튼은 MacOS 에서만 작동

import SwiftUI

struct PasteButtonView: View {
    @State var text = String()
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
            PasteButton(payloadType: String.self) { strings in
                guard let string = strings.first else {
                    return
                }
                text = string
            }
            .buttonBorderShape(.capsule)
            .labelStyle(.iconOnly)
            .tint(.red)
        }
    }
}

#Preview {
    PasteButtonView()
}
