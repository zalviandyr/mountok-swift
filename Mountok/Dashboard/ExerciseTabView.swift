//
//  ExerciseTabView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 08/05/25.
//

import SwiftUI

struct ExerciseTabView: View {
    private let backgroundGradient = LinearGradient(
        colors: [
            Color("Colors/BackgroundGradientStart"),
            Color("Colors/BackgroundGradientEnd")
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
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
                    }
                    .frame(width: 60, height: 60)
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color("Colors/BackgroundGradientEnd").opacity(0.4))
                .background(
                    Image("Images/Prau")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .frame(width: .infinity, height: 170)
                .cornerRadius(10)
                .padding(.bottom)
                
                // today activity
                Text("Today Activity")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                VStack {
                    HStack {
                        Text("ccc")
                    }
                }
                .frame(width: .infinity, height: 100)
                .background(.white)
                .cornerRadius(10)
                
                // next milestones
                Text("Next Milestones")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                VStack {
                    HStack {
                        Text("ccc")
                    }
                }
                .frame(width: .infinity, height: 100)
                .background(.white)
                .cornerRadius(10)
                
                Text("You can change your target by hit the button below, to change the Mountain or Depart Date.")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(.top)
                
                Button {
                    
                } label: {
                    Text("Change your plan")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.red)
                .padding(.top)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Last sync of VO2Max is 29 April 2026 at 11.05 PM")
                    Button("learn more about VO2Max") {
                        // Aksi ketika diklik
                        print("Learn more tapped")
                    }
                    .foregroundColor(.blue)
                }
                .font(.caption)
                .foregroundStyle(.white)
            }
            .padding()
        }
        .background(backgroundGradient)
    }
}

#Preview {
    ExerciseTabView()
}
