//
//  AlertWithButton.swift
//  Mountok
//
//  Created by Zukron Alviandy on 09/05/25.
//

import SwiftUI

struct AlertChangePlanView: View {
    var person: PersonModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .foregroundStyle(Color("Colors/Warning"))
                .frame(width: 25, height: 25)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(person.mountain.name) need VO2Max at \(person.mountainVo2.toFormattedVo2)")
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
    AlertChangePlanView(person: PersonModel.empty())
}
