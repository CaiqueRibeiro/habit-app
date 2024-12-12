//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 11/12/24.
//

import SwiftUI

enum SignUpViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
