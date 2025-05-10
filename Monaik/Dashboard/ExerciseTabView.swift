//
//  ExerciseTabView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 08/05/25.
//

import SwiftUI
import SwiftData

struct ExerciseTabView: View {
    @Binding var path: NavigationPath
    
    @Query
    private var persons: [PersonModel]
    
    @Query(sort: \ExerciseWeekModel.number)
    private var workouts: [ExerciseWeekModel]
    
    @State private var exerciseDate0: ExerciseDate?
    @State private var exerciseDate1: ExerciseDate?
    @State private var exerciseDate2: ExerciseDate?
    @State private var exerciseDate3: ExerciseDate?
    
    private var person: PersonModel {
        persons.first ?? PersonModel.empty()
    }
    
    func initFilteredWorkouts() {
        let calendar: Calendar = .current
        let day0 = Date()
        let day1 = calendar.date(byAdding: .day, value: 1, to: day0)!
        let day2 = calendar.date(byAdding: .day, value: 2, to: day0)!
        let day3 = calendar.date(byAdding: .day, value: 3, to: day0)!
        
        if !workouts.isEmpty {
            for workout in workouts {
                for exerciseDate in workout.exerciseDates {
                    // exercise0
                    if calendar.isDate(exerciseDate.date, inSameDayAs: day0) {
                        exerciseDate0 = exerciseDate
                    }
                    
                    // exercise1
                    if calendar.isDate(exerciseDate.date, inSameDayAs: day1) {
                        exerciseDate1 = exerciseDate
                    }
                    
                    // exercise2
                    if calendar.isDate(exerciseDate.date, inSameDayAs: day2) {
                        exerciseDate2 = exerciseDate
                    }
                    
                    // exercise3
                    if calendar.isDate(exerciseDate.date, inSameDayAs: day3) {
                        exerciseDate3 = exerciseDate
                    }
                }
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // alert
                if person.targetVo2 < person.mountainVo2 {
                    AlertChangePlanView(person: person)
                        .padding(.bottom, 10)
                }
                
                CurrentView(person: person)
                    .padding(.bottom, 10)
                
                if exerciseDate0 != nil {
                    // today activity
                    TodayActivityView(exercise: exerciseDate0!.exercise)
                        .padding(.bottom, 10)
                }
                
                // next activity
                if exerciseDate1 != nil {
                    NextActivityView(
                        exerciseDate1: exerciseDate1,
                        exerciseDate2: exerciseDate2,
                        exerciseDate3: exerciseDate3
                    )
                }
                
                Divider()
                    .padding(.vertical, 20)
                    .padding(.horizontal, -2)
                
                Text("You can change your target by hit the button below, to change the Mountain or Depart Date.")
                    .font(.caption)
                
                Button {
                    path.append(AppScreen.plan)
                } label: {
                    Text("Change your plan")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.red)
                .padding(.top)
                .padding(.bottom)
            }
            .padding()
        }
        .background(Color("Colors/BgScreen"))
        .onAppear {
            initFilteredWorkouts()
        }
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = .init()
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ExerciseWeekModel.self, configurations: config)
    let workouts = WorkoutPlannerUtil.generateDummy()

    // Tambahkan data dummy ke dalam container
    let context = container.mainContext
    for workout in workouts {
        context.insert(workout)
    }

    return ExerciseTabView(
        path: $path
    )
    .modelContainer(container)
}
