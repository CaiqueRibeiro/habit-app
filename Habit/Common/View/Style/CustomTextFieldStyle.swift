//
//  CustomTextFieldStyle.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 13/12/24.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                .stroke(.orange, lineWidth: 0.8))
        
    }
}
