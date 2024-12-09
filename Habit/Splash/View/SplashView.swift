//
//  SplashView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 02/12/24.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSigInScreen:
                viewModel.signInView()
            case .goToHomeScreen:
                Text("Tela Home...")
            case .error(let msg):
                loadingView(error: msg)
            }
        }.onAppear(perform: viewModel.onAppear)
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
    let viewModel = SplashViewModel()
    SplashView(viewModel: viewModel)
}
