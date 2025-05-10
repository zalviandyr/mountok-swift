//
//  ExerciseTabView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 08/05/25.
//

import SwiftUI

struct ExerciseTabView: View {
    @Binding var path: NavigationPath

    @State var isShowVo2Presented = false
    var vO2Description: String {
        "This is a measurement of your VO, max, which is the maximum amount of oxygen your body can consume during exercise, Also called cardiorespiratory fitness, this is a useful measurement for everyone from the very fit to those managing illness.\n\nA higher VO2 max indicates a higher level of cardio fitness and endurance.\n\nMeasuring VO2 max requires a physical test and special equipment. You can also get an estimated VO2 max with heart rate and motion data from a fitness tracker. Apple Watch can record an estimated VO max when you do a brisk walk, hike, or run outdoors.\n\nVO2 max is validated for users 20 and older. Most people can improve their VO2 max with more intense and more frequent cardiovascular exercise. Certainconditions or medications that limit your heart rate may cause an overestimation of your VO, max. VO, max is not validated for pregnant users. You can indicate you're taking certain medications or add a current pregnancy in Health Details."
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // alert
                AlertChangePlanView()
                    .padding(.bottom, 10)
                
                CurrentView()
                
                VStack(alignment: .leading) {
                    Text("Last sync of VO2Max is 29 April 2026 at 11.05 PM")
                    Button("learn more about VO2Max") {
                        isShowVo2Presented = true
                    }
                    .foregroundColor(.blue)
                }
                .font(.caption)
                .padding(.bottom, 10)
                
                // today activity
                TodayActivityView()
                    .padding(.bottom, 10)
                
                // next activity
                NextActivityView()
                
                Divider()
                    .padding(.vertical, 20)
                    .padding(.horizontal, -2)
                
                Text("You can change your target by hit the button below, to change the Mountain or Depart Date.")
                    .font(.caption)
                
                Button {
                    path.append(AppScreen.plan)
                } label: {
                    Text("Change your plan")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.red)
                .padding(.top)
                .padding(.bottom)
            }
            .sheet(isPresented: $isShowVo2Presented){
                NavigationStack {
                    VStack {
                        Text(vO2Description)
                        
                        Spacer()
                    }
                    .padding()
                    .navigationTitle("About VO2Max")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Back") {
                                self.isShowVo2Presented.toggle()
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = .init()

    ExerciseTabView(
        path: $path
    )
}
