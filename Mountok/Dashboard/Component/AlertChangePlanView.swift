//
//  AlertWithButton.swift
//  Mountok
//
//  Created by Zukron Alviandy on 09/05/25.
//

import SwiftUI

struct AlertChangePlanView: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .foregroundStyle(Color("Colors/Warning"))
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Mt. Prau require VO2Max at 50 ml/min/kg")
                        .font(.footnote)
                        .fontWeight(.bold)
                    
                    Text("Our recomendation to adjust your departure date to further date or change the mountain")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity)
            }
            
            Divider()
            
            Button {
                print("Okai")
            } label: {
                Text("Change your plan")
            }
        }
        .padding(.all, 10)
        .background(Color("Colors/BgWarning"))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    AlertChangePlanView()
}
