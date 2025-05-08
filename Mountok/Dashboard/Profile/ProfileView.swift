//
//  ProfileView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 07/05/25.
//

import SwiftUI
import HealthKit

struct ProfileView: View {
    @State private var vo2Value: Double = 0
    @State private var isShowPermissionAlert = false
    @State private var isShowVo2Alert = false
    private let healtStore = HKHealthStore()
    
    func requestPermission() {
        let vo2Type = HKObjectType.quantityType(forIdentifier: .vo2Max)!
        guard HKHealthStore.isHealthDataAvailable() else {
            print("Health data not available")
            return
        }
        
        // check permission
        healtStore.requestAuthorization(toShare: [], read: [vo2Type]) { success, error in
            // just do nothing
        }
        
        // TODO, read with sleep 1 second
        
    }
    
    func getHealthData() {
        let vo2Type = HKQuantityType.quantityType(forIdentifier: .vo2Max)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        // query
        let query = HKSampleQuery(sampleType: vo2Type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, results, error in
            if let result = results?.first as? HKQuantitySample {
                let ml = HKUnit.literUnit(with: .milli)
                let kg = HKUnit.gramUnit(with: .kilo)
                let min = HKUnit.minute()
                
                vo2Value = result.quantity.doubleValue(for: ml.unitDivided(by: kg).unitDivided(by: min))
            } else {
                isShowPermissionAlert = true
            }
        }
        
        healtStore.execute(query)
    }
    
    var body: some View {
        VStack {
            Text("Current VO2Max")
                .font(.title)
                .padding(.bottom)
            
            Text(String(format: "%.1f mL/kg/min", vo2Value))
        }
        .alert(isPresented: $isShowPermissionAlert) {
            Alert(
                title: Text("Permission needed"),
                message: Text("Please grant permission to access HealthKit")
            )
        }
        .alert(isPresented: $isShowVo2Alert) {
            Alert(
                title: Text("VO2Max is not available"),
                message: Text("Please do exercise")
            )
        }
        .onAppear() {
            self.requestPermission()
        }
    }
}

#Preview {
    ProfileView()
}
