//
//  EditTextView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 13/12/24.
//

import SwiftUI

struct EditTextView: View {
    
    @Binding var text: String

    var keyboard: UIKeyboardType = .default
    var placeholder: String = ""
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 14))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 14))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
                
            if let error = error, failure == true, !text.isEmpty {
                Text(error).foregroundColor(.red)
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    VStack {
        EditTextView(text: .constant(""),
                     placeholder: "Type here",
                     error: "Invalid input")
        .padding()
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
}
