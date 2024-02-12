// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(macOS 10.15, *)
public struct SwiftUIInputTextField: View {
    //MARK:- PROPERTIES
    var placeholder: Text
    var fontName: String
    var fontSize: CGFloat
    var fontColor: Color
    var foregroundColor: Color?
    @Binding var textInput: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            if textInput.isEmpty {
                placeholder.modifier(CustomTextM(fontName: fontName, fontSize: fontSize, fontColor: .gray))
            }
            TextField("", text: $textInput, onEditingChanged: editingChanged, onCommit: commit).foregroundColor((foregroundColor != nil) ? foregroundColor : .black).autocorrectionDisabled()
                .clipShape(Capsule())
        }
    }
}
@available(macOS 10.15, *)
struct CustomTextM: ViewModifier {
    //MARK:- PROPERTIES
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
     func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}

//:completeSettings = none
