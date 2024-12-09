//
//  HabitApp.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 02/12/24.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
