//
//  SignInViewModel.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 04/12/24.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .none
    
    func login(email: String, password: String) {
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .goToHomeScreen
        }
    }
}

extension SignInViewModel {
    /* that's being created and replacing splash view because
     does not make sense stacking screens in this situation */
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
    
    func signUpView() -> some View {
        return SignInViewRouter.makeSignUpView()
    }
}
