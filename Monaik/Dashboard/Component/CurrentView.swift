//
//  CurrentView.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct CurrentView: View {
    var person: PersonModel
    
    @State private var currentVo2: Double = 0
    @State private var lastSync: Date?
    @State private var progress: Double = 0
    @State private var dayToGo: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(person.mountain.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Keep going to reach \(person.targetVo2.toFormattedVo2)")
                        .font(.footnote)
                    
                    Spacer()
                    
                    Text("\(dayToGo) days to go")
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
                        .trim(from: 0, to: progress)
                        .stroke(style: .init(lineCap: .round))
                        .stroke(lineWidth: 8)
                        .fill(.blue)
                    
                    Text(String(format: "%.1f", currentVo2))
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
            
            if lastSync != nil {
                InfoAboutVo2View(lastSync: lastSync!)
            }
        }
        .onAppear {
            HealthUtil.onReadVo2User { result, date in
                currentVo2 = result
                lastSync = date
                
                // hitung progress
                progress = (result - person.baseVo2) / (person.targetVo2 - person.baseVo2)
                
                // cari day to go
                let calendar = Calendar.current
                dayToGo = calendar.dateComponents([.day], from: Date(), to: person.departDate).day ?? 0
            }
        }
    }
}

#Preview {
    CurrentView(
        person: PersonModel.empty()
    )
}
