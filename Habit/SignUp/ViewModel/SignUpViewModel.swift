//
//  SignUpViewModel.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 11/12/24.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var document: String = ""
    @Published var phone: String = ""
    @Published var birthDay: String = ""
    @Published var gender: Gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SingUpUIState = .none
    
    func signUp() {
        self.uiState = .loading
        
        WebService.postUser(fullName: fullName,
                            email: email,
                            password: password,
                            document: document,
                            phone: phone,
                            birthday: birthDay,
                            gender: gender.index)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.uiState = .success
//            self.publisher.send(true)
//        }
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
