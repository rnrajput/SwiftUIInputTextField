// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(macOS 10.15, *)
public struct SwiftUIInputTextField: View {
    //MARK:- PROPERTIES
    public var placeholder: Text
    public var fontName: String
    public var fontSize: CGFloat
    public var fontColor: Color
    public var foregroundColor: Color?
    @Binding public var textInput: String
    public var editingChanged: (Bool)->() = { _ in }
    public var commit: ()->() = { }
    
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
