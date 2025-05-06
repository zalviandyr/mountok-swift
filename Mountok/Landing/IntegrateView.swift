//
//  IntegrateView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct IntegrateView: View {
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
            Image("Icons/HealthApp")
            
            VStack(alignment: .leading) {
                Text("Sync your Health Apple\nHealth app.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("This application requires your VO2max data. VO2max is an indicator of cardiorespiratory fitness that represents the maximum amount of oxygen your body can utilize during intense physical activity. By integrating with the Health app, the application can estimate which mountains you are capable of hiking and provide training recommendations to help improve your VO2max.")
                
                Spacer()
                
                Button {
                    print("continue")
                } label: {
                    Text("Sync Health Data")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                }
            }
            .padding()
            .padding(.top, 0)
            .foregroundStyle(.white)
        }
        .padding(.bottom)
        .background(backgroundGradient)
    }
}

#Preview {
    IntegrateView()
}
