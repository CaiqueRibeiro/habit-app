//
//  SignInViewModel.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 04/12/24.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    
    private let publisher = PassthroughSubject<Bool, Never>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var uiState: SignInUIState = .none
    
    init() {
        cancellable = publisher.sink { value in
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    
    func login() {
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
        return SignInViewRouter.makeSignUpView(publisher: self.publisher)
    }
}

