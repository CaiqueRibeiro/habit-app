//
//  SignUpView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 07/12/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel    
    
    var body: some View {
        ZStack {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .center) {
                    
                    VStack(alignment: .leading, spacing: 9) {
                        Text("Registration")
                            .font(Font.system(.title).bold())
                            .padding(.bottom, 8)
                        
                        fullNameField
                        emailField
                        passwordField
                        documentField
                        phoneField
                        birthDayField
                        genderField
                        enterButton
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 8)
                
                if case SingUpUIState.error(let value) = viewModel.uiState {
                    Text("")
                        .alert(isPresented: .constant(true)) {
                            Alert(
                                title: Text("Habit"),
                                message: Text(value),
                                dismissButton: .default(Text("OK")) {
                                    /* do something when clicks */
                                }
                            )
                        }
                }
                
            }
            .padding(20)
            
        }
    }
}

extension SignUpView {
    var fullNameField: some View {
        EditTextView(text: $viewModel.fullName,
                     keyboard: .alphabet,
                     placeholder: "Full name *",
                     error: "Invalid name",
                     failure: viewModel.fullName.count < 3)
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     keyboard: .emailAddress,
                     placeholder: "E-mail *",
                     error: "Invalid e-mail",
                     failure: !viewModel.email.isEmail())
    }
}


extension SignUpView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
                     keyboard: .emailAddress,
                     placeholder: "Password *",
                     error: "Password must have 8 characters",
                     failure: viewModel.password.count < 8,
                     isSecure: true)
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(text: $viewModel.document,
                     keyboard: .numberPad,
                     placeholder: "Your CPF *",
                     error: "Invalid CPF",
                     failure: viewModel.document.count != 11)
    }
}

extension SignUpView {
    var phoneField: some View {
        EditTextView(text: $viewModel.phone,
                     keyboard: .numberPad,
                     placeholder: "Your phone *",
                     error: "Enter with DDD + 8 or 9 digits",
                     failure: viewModel.phone.count < 10 || viewModel.phone.count >= 12)
    }
}

extension SignUpView {
    var birthDayField: some View {
        EditTextView(text: $viewModel.birthDay,
                     keyboard: .default,
                     placeholder: "Your birthday *",
                     error: "invalid birthday. Must be dd/MM/yyyy",
                     failure: viewModel.birthDay.count != 10)
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.top, 16)
        .padding(.bottom, 32)
    }
}

extension SignUpView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.signUp()
        },
        text: "Sign Up",
                          disabled: !viewModel.email.isEmail() ||
                          viewModel.password.count < 8 ||
                          viewModel.fullName.count < 3 ||
                          viewModel.phone.count < 10 ||
                          viewModel.phone.count >= 12 ||
                          viewModel.birthDay.count != 10,
        showProgress: self.viewModel.uiState == SingUpUIState.loading)
    }
}

#Preview {
    let viewModel = SignUpViewModel()
    SignUpView(viewModel: viewModel)
}
