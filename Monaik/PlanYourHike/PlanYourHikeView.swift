//
//  ContentView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI
import SwiftData

struct PlanYourHikeView: View {
    @Binding var path: NavigationPath
    @Environment(\.modelContext) private var modelContext

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
    
    func doSave() {
        guard mountainVo2 > 0 else {
            isShowMountainError = true
            return
        }
        
        guard projectionVo2 > 0 else {
            isShowProjectionError = true
            return
        }
        
        do {
            // delete old person data
            let persons = try modelContext.fetch(FetchDescriptor<PersonModel>())
            
            for person in persons {
                modelContext.delete(person)
            }
            
            // save person model
            modelContext.insert(PersonModel(
                baseVo2: currentVo2,
                targetVo2: projectionVo2,
                mountainVo2: mountainVo2,
                mountain: selectedMountain!,
                departDate: selectedDate
            ))
            
            // generate workout
            let startDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            let endDate = selectedDate
            let workouts = WorkoutPlannerUtil.generateWorkoutPlan(
                startDate: startDate,
                endDate: endDate
            )
            
            // save workoute model
            for workout in workouts {
                modelContext.insert(workout)
            }
            
            path.append(AppScreen.dashboard)
        } catch {
            print(error)
        }
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
            HealthUtil.onReadVo2User { result, date in
                currentVo2 = result
            }
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
