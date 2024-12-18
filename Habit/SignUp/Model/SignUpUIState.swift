//
//  SignUpUIState.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 11/12/24.
//

import Foundation

enum SingUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
