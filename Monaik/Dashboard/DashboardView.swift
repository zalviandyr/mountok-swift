//
//  DashboardView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 08/05/25.
//

import SwiftUI

struct DashboardView: View {
    @Binding var path: NavigationPath

    func applyUiAppearance() {
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundColor = UIColor(
            .gray.opacity(0.2)
        )
    }
    
    var body: some View {
        TabView {
            ExerciseTabView(path: $path)
                .tabItem {
                    Label("Exercise", systemImage: "figure.run.circle")
                        .background(.white)
                }
                .navigationBarBackButtonHidden()
            
            ScheduleTabView(path: $path)
                .tabItem {
                    Label("Schedule", systemImage: "calendar.circle")
                }
                .navigationBarBackButtonHidden()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            applyUiAppearance()
        }
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = .init()

    DashboardView(
        path: $path
    )
}
