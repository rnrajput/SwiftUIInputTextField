// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


@available(macOS 14.0, *)
public struct SwiftUIInputTextField: View {
    //MARK:- PROPERTIES
    public var fontName: String?
    public var fontSize: CGFloat?
    public var foregroundColor: Color?
    public var editingChanged: (Bool)->() = { _ in }
    public var commit: ()->() = { }
    public var height: Float? = 45
    public var placeholder: String?
    public var isPassword: Bool? = false
    @Binding public var textInput: String
    
    public init(placeholder: String, fontName: String?, fontSize: CGFloat?, fontColor: Color?, foregroundColor: Color? = nil,height: Float = 0.0, isPassword: Bool = false, textInput: Binding<String>) {
        self.placeholder = placeholder
        self.fontName = fontName
        self.fontSize = fontSize
        self.foregroundColor = foregroundColor
        self.height = height
        self.isPassword = isPassword
        _textInput = textInput
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            if self.isPassword == true {
                SecureField(placeholder ?? "", text: $textInput, onCommit: commit)
                .textCase(.lowercase)
                .font(.custom(fontName ?? "", size: CGFloat(fontSize ?? 0.0)))
                .foregroundColor((foregroundColor != nil) ? foregroundColor : .black).autocorrectionDisabled()
                .frame(height: CGFloat(height ?? 45.0))
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 8)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(foregroundColor ?? Color.gray.opacity(0.3)))
                .padding([.horizontal], 30)
                .disableAutocorrection(true)
                .onChange(of: textInput) { newValue in
                    textInput = setTextCase(text: textInput)
                }
                
            } else {
                TextField(placeholder ?? "", text: $textInput,onEditingChanged: { _ in
                    textInput = setTextCase(text: textInput)
                }, onCommit: commit)
                .textCase(.lowercase)
                .font(.custom(fontName ?? "", size: CGFloat(fontSize ?? 0.0)))
                .foregroundColor((foregroundColor != nil) ? foregroundColor : .black).autocorrectionDisabled()
                .frame(height: CGFloat(height ?? 45.0))
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 8)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(foregroundColor ?? Color.gray.opacity(0.3)))
                .padding([.horizontal], 30)
                .disableAutocorrection(true)
                .onChange(of: textInput) { newValue in
                    textInput = setTextCase(text: textInput)
                }
            }
        }
    }
}
@available(macOS 14.0, *)
public extension SwiftUIInputTextField {
    func setTextCase(text: String) -> String {
        return text.lowercased()
    }
}
//:completeSettings = none
