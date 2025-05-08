//
//  ExerciseTabView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 08/05/25.
//

import SwiftUI

struct ExerciseTabView: View {
    @State var sheetPresented = false
    private let backgroundGradient = LinearGradient(
        colors: [
            Color("Colors/BackgroundGradientStart"),
            Color("Colors/BackgroundGradientEnd")
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    var VO2maxDescription: String {
        "This is a measurement of your VO, max, which is the maximum amount of oxygen your body can consume during exercise, Also called cardiorespiratory fitness, this is a useful measurement for everyone from the very fit to those managing illness.\n\nA higher VO2 max indicates a higher level of cardio fitness and endurance.\n\nMeasuring VO2 max requires a physical test and special equipment. You can also get an estimated VO2 max with heart rate and motion data from a fitness tracker. Apple Watch can record an estimated VO max when you do a brisk walk, hike, or run outdoors.\n\nVO2 max is validated for users 20 and older. Most people can improve their VO2 max with more intense and more frequent cardiovascular exercise. Certainconditions or medications that limit your heart rate may cause an overestimation of your VO, max. VO, max is not validated for pregnant users. You can indicate you're taking certain medications or add a current pregnancy in Health Details."
    }
    
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
                .background(Color("Colors/BackgroundGradientEnd").opacity(0.4))
                .background(
                    Image("Images/Prau")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
                .frame(height: 170)
                .cornerRadius(10)
                .padding(.bottom)
                .shadow(radius: 5)
                
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
                .frame(height: 100)
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
                .frame(height: 100)
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
                        sheetPresented=true
                    }
                    .foregroundColor(.blue)
                }
                .font(.caption)
                .foregroundStyle(.white)
            }
            .sheet(isPresented: $sheetPresented){
                NavigationStack {
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("VO2Max")
                                .font(.title)
                                .fontWeight(.bold)
                            Text(VO2maxDescription)
                 }
                    }.padding()
                        .navigationTitle("About VO2Max")
                        .navigationBarTitleDisplayMode(.inline)
                }
                
.presentationDragIndicator(.visible)
                    
            }
            .padding()
        }
        .background(backgroundGradient)

    }
}

#Preview {
    ExerciseTabView()
}
