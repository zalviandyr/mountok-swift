//
//  IntegrateView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI
import HealthKit

struct IntegrateView: View {
    func requestPermission() {
        let healthStore: HKHealthStore = .init()
        let vo2Type = HKObjectType.quantityType(forIdentifier: .vo2Max)!
        
        guard HKHealthStore.isHealthDataAvailable() else {
            print("Health data not available")
            return
        }
        
        // check permission
        healthStore.requestAuthorization(toShare: [], read: [vo2Type]) { success, error in
            // just do nothing
        }
        
        // navigate to plan your hike
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray5).ignoresSafeArea()
                
                VStack{
                    Image("Icons/Lungs")
                    
                    HStack{
                        Text("Welcome")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        Text("VO2Max is an indicator of cardiorespiratory fitness that represents the maximum amount of oxygen your body can utilize during intense physical activity.")
                            .font(.body)
                            .padding(.top, 2)
                    }
                    
                    VStack{
                        Image("Icons/HealthClock")
                            .padding(.top)
                        
                        Text("By connecting the Health app, you can monitor your VO2max levels and track their progress to assess your readiness for hiking.")
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.caption)
                            .padding([.leading, .bottom, .trailing])
                        
                        NavigationLink {
                            PlanYourHikeView()
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
                        
                        
                        //                        Button {
                        //                            requestPermission()
                        //                        } label: {
                        //                            HStack {
                        //                                Image(systemName: "applewatch")
                        //                                Text("Sync Health Data")
                        //                            }
                        //                            .padding()
                        //                            .frame(maxWidth: .infinity)
                        //                            .background(Color.blue)
                        //                            .foregroundColor(.white)
                        //                            .cornerRadius(10)
                        //                            .padding([.leading, .bottom, .trailing])
                        //                        }
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.top)
                    
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    IntegrateView()
}
