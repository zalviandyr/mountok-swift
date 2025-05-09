//
//  PrepareView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct PrepareView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Prepare Your Hike")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text("\"Know your body's ability to hike in the Indonesian")
                .font(.caption)
            Text("mountains based on your VO2max calculation.\"")
                .font(.caption)
            
            Button {
                path.append(AppScreen.integrate)
            } label: {
                Text("Get Started")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
            }
            .padding(.top)
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            Image("Images/Mountain")
        )
        .padding(.bottom)
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = .init()

    PrepareView(
        path: $path
    )
}
