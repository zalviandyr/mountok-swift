//
//  AlertVo2NotFeasibleView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 09/05/25.
//

import SwiftUI

struct AlertVo2NotFeasibleView: View {
    var mountain: Mountain
    var vo2Needed: Double
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .foregroundStyle(Color("Colors/Warning"))
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(mountain.name) require VO2Max at \(vo2Needed.toFormattedVo2)")
                        .font(.footnote)
                        .fontWeight(.bold)
                    
                    Text("Our recomendation to adjust your departure date to further date or change the mountain")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.all, 10)
        .background(Color("Colors/BgWarning"))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    let mountain = Mountain(
        name: "Mt. Prau", elevation: 2565
    )
    AlertVo2NotFeasibleView(mountain: mountain, vo2Needed: 37.5)
}
