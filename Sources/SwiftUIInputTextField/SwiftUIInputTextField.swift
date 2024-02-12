// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(macOS 10.15, *)
public struct SwiftUIInputTextField: View {
    //MARK:- PROPERTIES
    public var placeholder: String?
    public var fontName: String?
    public var fontSize: CGFloat?
    public var fontColor: Color?
    public var foregroundColor: Color?
    @Binding public var textInput: String
    public var editingChanged: (Bool)->() = { _ in }
    public var commit: ()->() = { }

    public init(placeholder: String?, fontName: String?, fontSize: CGFloat?, fontColor: Color?, foregroundColor: Color? = nil, textInput: Binding<String>) {
        self.placeholder = placeholder
        self.fontName = fontName
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.foregroundColor = foregroundColor
        _textInput = textInput
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            TextField(placeholder ?? "", text: $textInput, onEditingChanged: editingChanged, onCommit: commit).foregroundColor((foregroundColor != nil) ? foregroundColor : .black).autocorrectionDisabled()
                .clipShape(Capsule())
            textFieldStyle(.roundedBorder)
            .frame(height: 42)
            .padding(.leading,5)
            .padding(.trailing,5)
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
