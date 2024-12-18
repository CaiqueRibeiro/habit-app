//
//  SignInView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 04/12/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var navigationHidden: Bool = true
    
    @State var action: Int? = 0
    
    var body: some View {
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView { // necessary for navigation from one view to another without changing the reference (pile views)
                    ScrollView(showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) { // just to make scroll design better
                            
                            Spacer(minLength: 36)
                            
                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                
                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                
                                emailField
                                passwordField
                                enterButton
                                registerLink
                                
                                Text("Copyright @YYY")
                                    .foregroundColor(.gray)
                                    .font(Font.system(size: 12).bold())
                                    .padding(.top, 16)
                            }
                            
                        }
                        
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .navigationBarTitle("Login", displayMode: .inline)
                    .navigationBarHidden(navigationHidden) // hides navigation bar in current screen
                }
            }
        }
    }
}

extension SignInView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     keyboard: .emailAddress,
                     placeholder: "E-mail",
                     error: "Invalid e-mail",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignInView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
                     keyboard: .emailAddress,
                     placeholder: "Password",
                     error: "Password must have 8 characters",
                     failure: viewModel.password.count < 8,
                     isSecure: true)
    }
}

extension SignInView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.login()
        },
        text: "Sign In",
                          disabled: !viewModel.email.isEmail() || viewModel.password.count < 8,
        showProgress: self.viewModel.uiState == SignInUIState.loading)
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Not registered yet?")
                .foregroundColor(.gray)
                .padding(.top, 48)
        
            ZStack {
                NavigationLink(
                    destination: viewModel.signUpView(),
                    tag: 1,
                    selection: $action,
                    label: { EmptyView() })
                
                Button("Register") {
                    self.action = 1
                }
            }
        }
    }
}

#Preview {
    let viewModel = SignInViewModel()
    SignInView(viewModel: viewModel)
}


