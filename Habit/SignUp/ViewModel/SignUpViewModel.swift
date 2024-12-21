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
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateFormatted = formatter.date(from: birthDay)
        
        guard let dateFormatted = dateFormatted else {
            self.uiState = .error("Invalid birthdate: \(birthDay)")
            return
        }
        
        formatter.dateFormat = "yyyy-MM-dd"
        let birthDayFormatted = formatter.string(from: dateFormatted)
        
        
        WebService.postUser(request: SignUpRequest(fullName: fullName,
                                                   email: email,
                                                   password: password,
                                                   document: document,
                                                   phone: phone,
                                                   birthday: birthDayFormatted,
                                                   gender: gender.index))
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
