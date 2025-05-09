//
//  IntegrateView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct IntegrateView: View {
    var body: some View {
        ZStack {
            Color(.systemGray5).ignoresSafeArea()
            VStack {
                VStack{
                    Image("Icons/ParuParu1")
                    HStack{
                        Text("Welcome")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack{
                        Text("VO2Max is an indicator of cardiorespiratory fitness that represents the maximum amount of oxygen your body can utilize during intense physical activity.")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                    VStack{
                        Image("Icons/HealthClock")
                            .padding(.top)
                        Text("By connecting the Health app, you can monitor your VO2max levels and track their progress to assess your readiness for hiking.")
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.caption)
                            .padding([.leading, .bottom, .trailing])
                        Button {
                            // Action
                        } label: {
                            HStack {
                                Image(systemName: "applewatch")
                                Text("Sync Health Data")
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding([.leading, .bottom, .trailing])
                        }
                        
                    }.background(.white)
                        .cornerRadius(10)

                    
                    Spacer()
                    
                }
            }.padding()
        }
        
    }
}

//import SwiftUI
//
//struct IntegrateView: View {
//    let backgroundGradient = LinearGradient(
//        colors: [
//            Color("Colors/BgGradientStart"),
//            Color("Colors/BgGradientEnd")
//        ],
//        startPoint: .top,
//        endPoint: .bottom
//    )
//    
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//                Image("Icons/HealthApp")
//                
//                VStack(alignment: .leading) {
//                    Text("Sync your Health Apple\nHealth app.")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .padding(.bottom)
//                    
//                    Text("This application requires your VO2max data. VO2max is an indicator of cardiorespiratory fitness that represents the maximum amount of oxygen your body can utilize during intense physical activity. By integrating with the Health app, the application can estimate which mountains you are capable of hiking and provide training recommendations to help improve your VO2max.")
//                    
//                    Spacer()
//                    
//                    NavigationLink {
//                        SetYourTargetView()
//                    } label: {
//                        Text("Sync Health Data")
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                            .font(.headline)
//                    }
//                }
//                .padding()
//                .padding(.top, 0)
//                .foregroundStyle(.white)
//            }
//            .padding(.bottom)
//            .background(backgroundGradient)
//        }
//        .navigationBarBackButtonHidden()
//    }
//}
//
#Preview {
    IntegrateView()
}
