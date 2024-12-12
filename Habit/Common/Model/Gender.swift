//
//  Gender.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 09/12/24.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    
    var id: String {
        self.rawValue
    }
}
