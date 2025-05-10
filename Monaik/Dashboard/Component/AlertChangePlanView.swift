//
//  AlertWithButton.swift
//  Mountok
//
//  Created by Zukron Alviandy on 09/05/25.
//

import SwiftUI

struct AlertChangePlanView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .foregroundStyle(Color("Colors/Warning"))
                .frame(width: 25, height: 25)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Mt. Prau need VO2Max at 50 ml/min/kg")
                    .font(.footnote)
                    .fontWeight(.bold)
                
                Text("Our recomendation to adjust your departure date to further date or change the mountain")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.all, 10)
        .background(Color("Colors/BgWarning"))
        .cornerRadius(10)
        .shadow(color: Color("Colors/Warning"), radius: 1)
    }
}

#Preview {
    AlertChangePlanView()
}
