//
//  DashboardView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 08/05/25.
//

import SwiftUI

struct DashboardView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundColor = UIColor(
            .gray.opacity(0.2)
        )
    }
    
    var body: some View {
        TabView {
            ExerciseTabView()
                .tabItem {
                    Label("Exercise", systemImage: "figure.run.circle")
                        .background(.white)
                }
            
            ProfileView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar.circle")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DashboardView()
}
