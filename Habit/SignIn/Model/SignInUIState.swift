//
//  SignInUIState.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 07/12/24.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
