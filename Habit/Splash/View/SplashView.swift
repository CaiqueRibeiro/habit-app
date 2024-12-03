//
//  SplashView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 02/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var state: SplashUIState = .loading
    
    var body: some View {
        switch state {
        case .loading:
            loadingView()
        case .goToSigInScreen:
            Text("Tela login...")
        case .goToHomeScreen:
            Text("Tela Home...")
        case .error(let msg):
            loadingView(error: msg)
        }
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea() // to get full screen
        }
        .alert(isPresented: .constant(error != nil)) {
            Alert(
                title: Text("Habit"),
                message: Text(error ?? ""),
                dismissButton: .default(Text("OK")) {
                    /* do something when clicks */
                }
            )
        }
    }
}

#Preview {
    SplashView(state: .error("oiii"))
}
