//
//  AlertWarning.swift
//  Mountok
//
//  Created by Zukron Alviandy on 09/05/25.
//

import SwiftUI

struct AlertVo2NotAvailableView: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .foregroundStyle(Color("Colors/Warning"))
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your VO2Max is not available")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("Please do an aerobic exercise, such as cycling, outdoor run, and hiking at least 15 minutes")
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
    AlertVo2NotAvailableView()
}
