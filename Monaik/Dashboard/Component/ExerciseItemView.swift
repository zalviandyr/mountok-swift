//
//  ExerciseItemView.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct ExerciseItemView: View {
    var exerciseDate: ExerciseDate
    
    private var label: String {
        exerciseDate.exercise.type == .rest
        ? "\(exerciseDate.exercise.name)"
        : "\(exerciseDate.exercise.name) - \(exerciseDate.exercise.duration)"
    }
    
    var body: some View {
        HStack {
            Image(systemName: exerciseDate.exercise.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15)
                .padding(.trailing, 5)

            VStack(alignment: .leading) {
                Text(exerciseDate.date.toLongDateString)
                    .font(.headline)

                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "checkmark")
                .foregroundColor(.green)
        }
    }
}

#Preview {
    let exerciseDate = ExerciseDate(
        date: Date(),
        exercise: Exercise.enjoying
    )
    
    ExerciseItemView(exerciseDate: exerciseDate)
}
