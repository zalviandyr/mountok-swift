//
//  ScheduleView.swift
//  Mountok
//
//  Created by Fariz Ajy Putra on 08/05/25.
//

import SwiftUI
import SwiftData

struct ScheduleTabView: View {
    @Binding var path: NavigationPath
    
    @Query(sort: \ExerciseWeekModel.number)
    private var workouts: [ExerciseWeekModel]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(workouts, id: \.number) { workout in
                    Section {
                        ForEach(workout.exerciseDates, id: \.date) { exerciseDate in
                            ExerciseItemView(exerciseDate: exerciseDate)
                        }
                    } header: {
                        Text("Week \(workout.number)")
                    }

                }
            }
            .navigationTitle("Exercise Schedule")
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

    return ScheduleTabView(
        path: $path,
    )
    .modelContainer(container)
}
