//
//  MountokApp.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI
import SwiftData

enum AppScreen: Hashable {
    case prepare, integrate, plan, dashboard
}

@main
struct MonaikApp: App {
    @State private var path: NavigationPath = .init()

    init() {
        // force to light mode
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                LandingView(path: $path)
                    .navigationDestination(for: AppScreen.self) { screen in
                        switch screen {
                        case .prepare:
                            PrepareView(path: $path)
                        case .integrate:
                            IntegrateView(path: $path)
                        case .plan:
                            PlanYourHikeView(path: $path)
                        case .dashboard:
                            DashboardView(path: $path)
                        }
                    }
            }
        }
        .modelContainer(for: [PersonModel.self, ExerciseWeekModel.self])
    }
}
