//
//  SignUpViewModel.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 11/12/24.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .none
    
    func signUp() {
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .goToHomeScreen
        }
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
