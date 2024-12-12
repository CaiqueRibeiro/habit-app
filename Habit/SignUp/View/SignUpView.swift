//
//  SignUpView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 07/12/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var document: String = ""
    @State var phone: String = ""
    @State var birthDay: String = ""
    @State var gender: Gender = Gender.male
    
    
    var body: some View {
        ZStack {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .center) {
                    
                    VStack(alignment: .leading, spacing: 9) {
                        Text("Registration")
                            .foregroundColor(.black)
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
                
                if case SignInUIState.error(let value) = viewModel.uiState {
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
        TextField("", text: $fullName)
            .border(Color.orange)
    }
}

extension SignUpView {
    var emailField: some View {
        TextField("", text: $email)
            .border(Color.orange)
    }
}


extension SignUpView {
    var passwordField: some View {
        SecureField("", text: $password)
            .border(Color.orange)
    }
}

extension SignUpView {
    var documentField: some View {
        TextField("", text: $document)
            .border(Color.orange)
    }
}

extension SignUpView {
    var phoneField: some View {
        TextField("", text: $phone)
            .border(Color.orange)
    }
}

extension SignUpView {
    var birthDayField: some View {
        TextField("", text: $birthDay)
            .border(Color.orange)
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $gender) {
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
        Button("Make you register") {
            viewModel.signUp()
        }
        .background(Color.orange)
        .foregroundColor(Color.white)
    }
}

#Preview {
    let viewModel = SignUpViewModel()
    SignUpView(viewModel: viewModel)
}
