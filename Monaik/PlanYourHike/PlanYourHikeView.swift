//
//  ContentView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI
import HealthKit

struct PlanYourHikeView: View {
    @Binding var path: NavigationPath
    
    // mountain properties
    @State private var selectedMountain: Mountain?
    @State private var mountainVo2: Double = 0
    @State private var isShowMountainError = false
    
    // projection properties
    @State private var selectedDate: Date = Date()
    @State private var projectionVo2: Double = 0
    @State private var isShowProjectionError = false
    
    // other properties
    @State private var currentVo2: Double = 0
    @State private var isShowGuidelineSheet = false
    
    // set to false, to validate current vo2
    private let debug = true
    
    func readVo2User() {
        if debug {
            currentVo2 = 35.0
            return
        }
        
        let healthStore = HKHealthStore()
        let vo2Type = HKQuantityType.quantityType(forIdentifier: .vo2Max)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        // query
        let query = HKSampleQuery(sampleType: vo2Type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, results, error in
            if let result = results?.first as? HKQuantitySample {
                let ml = HKUnit.literUnit(with: .milli)
                let kg = HKUnit.gramUnit(with: .kilo)
                let min = HKUnit.minute()
                
                currentVo2 = result.quantity.doubleValue(for: ml.unitDivided(by: kg).unitDivided(by: min))
            }
        }
        
        healthStore.execute(query)
    }
    
    func doSave() {
        guard mountainVo2 > 0 else {
            isShowMountainError = true
            return
        }
        
        guard projectionVo2 > 0 else {
            isShowProjectionError = true
            return
        }
        
        path.append(AppScreen.dashboard)
    }
    
    var alertView: some View {
        // validasi jika vo2max nya belum ada
        if currentVo2 <= 0 {
            return AnyView(AlertVo2NotAvailableView())
        }
        
        // validasi jika user belum pilih tanggal dan gunung
        if projectionVo2 <= 0 && mountainVo2 <= 0 {
            return AnyView(EmptyView())
        }
        
        // validasi jika tanggal yang dipilih tidak cocok
        if mountainVo2 >= projectionVo2 {
            return AnyView(AlertVo2NotFeasibleView(
                mountain: selectedMountain!,
                vo2Needed: mountainVo2
            ))
        }
        
        return AnyView(EmptyView())
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Plan Your Hike")
                    .font(.title)
                    .padding()
                
                alertView
                    .padding(.vertical)
                
                MountainView(
                    isShowMountainError: $isShowMountainError,
                    selectedMountain: $selectedMountain,
                    mountainVo2: $mountainVo2
                )
                .padding(.bottom)
                
                ProjectionVo2View(
                    isShowProjectionError: $isShowProjectionError,
                    selectedDate: $selectedDate,
                    projectionVo2: $projectionVo2
                )
                
                Spacer()
                
                GuidelineView()
                    .padding(.bottom)
                
                Button {
                    doSave()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .disabled(currentVo2 <= 0)
            }
            .padding()
            .background(Color("Colors/BgScreen"))
        }
        .onAppear {
            readVo2User()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = .init()

    PlanYourHikeView(
        path: $path
    )
}
