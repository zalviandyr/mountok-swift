//
//  HealtUtil.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import HealthKit

class HealthUtil {
    static func onRequestPermission(
        completion: @escaping (Bool) -> Void
    ) {
        let healthStore: HKHealthStore = .init()
        let vo2Type = HKObjectType.quantityType(forIdentifier: .vo2Max)!
        
        guard HKHealthStore.isHealthDataAvailable() else {
            print("Health data not available")
            return
        }
        
        // check permission
        healthStore.requestAuthorization(toShare: [], read: [vo2Type]) { success, error in
            completion(success)
        }
    }
    
    static func onReadVo2User(
        completion: @escaping (Double, Date?) -> Void
    ) {
        let healthStore = HKHealthStore()
        let vo2Type = HKQuantityType.quantityType(forIdentifier: .vo2Max)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        // query
        let query = HKSampleQuery(sampleType: vo2Type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, results, error in
            if let result = results?.first as? HKQuantitySample {
                let ml = HKUnit.literUnit(with: .milli)
                let kg = HKUnit.gramUnit(with: .kilo)
                let min = HKUnit.minute()
                
                let currentVo2 = result.quantity.doubleValue(for: ml.unitDivided(by: kg).unitDivided(by: min))
                
                completion(currentVo2, Date())
            } else {
                completion(0, nil)
            }
        }
        
        healthStore.execute(query)
    }
}
