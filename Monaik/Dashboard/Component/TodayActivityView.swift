//
//  TodayActivityView.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct TodayActivityView: View {
    private let activity = Text("Outdoor Run")
        .fontWeight(.bold)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Today Activity")
                .font(.title)
                .fontWeight(.bold)
            
            ZStack(alignment: .topLeading) {
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("Set \(activity) in your Apple Watch to do Exercise")
                            .font(.footnote)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                        
                        Spacer()
                    }
                }
                .background(Color("Colors/BgGray"))
                .frame(height: 145)
                .cornerRadius(10)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Jumping Rope")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        HStack(spacing: 5) {
                            Image(systemName: "timer")
                                .resizable()
                                .frame(width: 12, height: 12)
                            
                            Text("30 Minutes")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text("Is an effective workout that can increase your cardiorespiratory")
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    Image("Icons/JumpingRope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding()
                .frame(height: 120)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 1)
            }
        }
    }
}

#Preview {
    TodayActivityView()
}
