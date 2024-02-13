// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(macOS 15.0, *)
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
    public var isPassword: Bool? = false
    public var height: Float? = 45

    public init(placeholder: String, fontName: String?, fontSize: CGFloat?, fontColor: Color?, foregroundColor: Color? = nil,height: Float = 0.0, isPassword: Bool = false, textInput: Binding<String>) {
        self.placeholder = placeholder
        self.fontName = fontName
        self.fontSize = fontSize
        self.fontColor = fontColor
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
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(foregroundColor ?? Color.gray.opacity(0.3)))
                    .padding([.horizontal], 30)
                
            } else {
                TextField(placeholder ?? "", text: $textInput, onEditingChanged: editingChanged, onCommit: commit)
                    .textCase(.lowercase)
                    .font(.custom(fontName ?? "", size: CGFloat(fontSize ?? 0.0)))
                    .foregroundColor((foregroundColor != nil) ? foregroundColor : .black).autocorrectionDisabled()
                    .frame(height: CGFloat(height ?? 45.0))
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 8)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(foregroundColor ?? Color.gray.opacity(0.3)))
                    .padding([.horizontal], 30)
            }
        }
    }
}
//:completeSettings = none
