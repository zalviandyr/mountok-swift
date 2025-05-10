//
//  LandingView.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI
import SwiftData

struct LandingView: View {
    @Binding var path: NavigationPath

    @Query var persons: [PersonModel]

    var body: some View {
        if persons.count > 0 {
            DashboardView(path: $path)
        } else {
            PrepareView(path: $path)
        }
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = .init()

    LandingView(
        path: $path
    )
}
