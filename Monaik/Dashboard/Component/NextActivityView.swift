//
//  NextActivityVIew.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct NextActivityView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Next Activity")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Jumping Rope")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    HStack(spacing: 5) {
                        Image(systemName: "timer")
                            .resizable()
                            .frame(width: 10, height: 10)
                        
                        Text("30 Minutes")
                            .font(.caption2)
                    }
                    
                    HStack(alignment: .bottom) {
                        Text("Tomorrow")
                            .font(.footnote)
                        
                        Spacer()
                        
                        Image("Icons/Cycling")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding(.all, 10)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 1)
                
                VStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Jogging")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("25 April 2025")
                            .font(.caption2)
                    }
                    .padding(.all, 5)
                    .padding(.horizontal, 6)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Jogging")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("25 April 2025")
                            .font(.caption2)
                    }
                    .padding(.all, 5)
                    .padding(.horizontal, 6)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                }
            }
            .frame(height: 120)
        }
    }
}

#Preview {
    NextActivityView()
}
