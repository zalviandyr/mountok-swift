//
//  InfoAboutVo2View.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct InfoAboutVo2View: View {
    var lastSync: Date
    
    @State var isShowVo2Presented = false
    
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()
    
    private let vO2Description: String =
        "This is a measurement of your VO, max, which is the maximum amount of oxygen your body can consume during exercise, Also called cardiorespiratory fitness, this is a useful measurement for everyone from the very fit to those managing illness.\n\nA higher VO2 max indicates a higher level of cardio fitness and endurance.\n\nMeasuring VO2 max requires a physical test and special equipment. You can also get an estimated VO2 max with heart rate and motion data from a fitness tracker. Apple Watch can record an estimated VO max when you do a brisk walk, hike, or run outdoors.\n\nVO2 max is validated for users 20 and older. Most people can improve their VO2 max with more intense and more frequent cardiovascular exercise. Certainconditions or medications that limit your heart rate may cause an overestimation of your VO, max. VO, max is not validated for pregnant users. You can indicate you're taking certain medications or add a current pregnancy in Health Details."
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Last sync of VO2Max is \(lastSync.toDateAndTimeString)")
            
//            Button("learn more about VO2Max") {
//                isShowVo2Presented.toggle()
//            }
//            .foregroundColor(.blue)
        }
        .font(.caption)
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
    }
}

#Preview {
    InfoAboutVo2View(lastSync: Date())
}
