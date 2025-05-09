//
//  MountokApp.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

enum AppScreen: Hashable {
    case integrate, plan, dashboard
}

@main
struct MounaikApp: App {
    @State private var path: NavigationPath = .init()

    init() {
        // force to light mode
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                PrepareView(path: $path)
                    .navigationDestination(for: AppScreen.self) { screen in
                        switch screen {
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
    }
}
