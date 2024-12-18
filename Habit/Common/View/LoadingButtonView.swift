//
//  LoadingButtonView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 16/12/24.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var text: String = "Loading..."
    var disabled: Bool = false
    var showProgress: Bool = false
    
    var body: some View {
        ZStack {
            Button(action: {
                action()
            }, label: {
                Text(showProgress ? "" : text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(.title3).bold())
                    .background(disabled ? Color("lightOrange") : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(4.0)
            }).disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}

#Preview {
    LoadingButtonView(action: {
        print("oiii")
    })
}
