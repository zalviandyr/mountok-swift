//
//  LandingView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct LandingView: View {
    let backgroundGradient = LinearGradient(
        colors: [
            Color("Colors/BackgroundGradientStart"),
            Color("Colors/BackgroundGradientEnd")
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mountok")
                .padding(.bottom)
                .font(.largeTitle)
            
            Text("It is an application that estimates your ability to complete a same-day round trip hike (tektok) on a specific mountain, with the assessment based on the VO2max you possess. VO2max refers to the maximum amount of oxygen your body can utilize during intense exercise, and it is a key indicator of your cardiovascular fitness and endurance capacity.")
            
            Spacer()
            
            Button {
                print("continue")
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
            }

        }
        .padding()
        .padding(.bottom)
        .foregroundStyle(.white)
        .background(backgroundGradient)
    }
}

#Preview {
    LandingView()
}
