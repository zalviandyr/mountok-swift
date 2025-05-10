//
//  CurrentView.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct CurrentView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Mt. Prau")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Need 5% to reach 40 ml/min/kg")
                    .font(.subheadline)
                
                Spacer()
                
                Text("90 days ago")
                    .font(.footnote)
                    .bold()
            }
            
            Spacer()
            
            ZStack {
                Circle()
                    .fill(.ultraThinMaterial)
                    .padding(.all, 3)
                
                Circle()
                    .rotation(.degrees(270))
                    .stroke(lineWidth: 8)
                    .fill(.gray)
                    .opacity(0.6)
                
                Circle()
                    .rotation(.degrees(270))
                    .trim(from: 0, to: 0.1)
                    .stroke(style: .init(lineCap: .round))
                    .stroke(lineWidth: 8)
                    .fill(.blue)
                
                Text("35.4")
                    .fontWeight(.bold)
            }
            .frame(width: 60, height: 60)
        }
        .padding()
        .foregroundStyle(.white)
        .background(Color("Colors/BgGradientEnd").opacity(0.4))
        .background(
            Image("Images/Prau")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .frame(height: 120)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

#Preview {
    CurrentView()
}
