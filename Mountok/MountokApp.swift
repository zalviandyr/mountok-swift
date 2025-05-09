//
//  MountokApp.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

@main
struct MountokApp: App {
    init() {
        // force to light mode
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            PrepareView()
        }
    }
}
