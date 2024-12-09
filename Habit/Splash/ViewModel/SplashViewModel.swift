//
//  SplashViewModel.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 03/12/24.
//

import SwiftUI

// ObservableObject says that, even not being in file for rendering, should be parameter for renders
class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        // make async job and change the uiState
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // called after 2 seconds
            self.uiState = .goToSigInScreen
        }
    }
}

extension SplashViewModel {
    /* that's being created and replacing splash view because
     does not make sense stacking screens in this situation */
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
