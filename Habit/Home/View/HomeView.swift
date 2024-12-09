//
//  HomeView.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 07/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Home Page!")
    }
}

#Preview {
    let viewModel = HomeViewModel()
    HomeView(viewModel: viewModel)
}
