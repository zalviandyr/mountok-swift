//
//  ExerciseWeek.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import Foundation
import SwiftData

@Model
class ExerciseWeekModel {
    var number: Int
    var startDate: Date
    var endDate: Date
    var exerciseDates: [ExerciseDate]
    
    init(number: Int, startDate: Date, endDate: Date, exerciseDates: [ExerciseDate]) {
        self.number = number
        self.startDate = startDate
        self.endDate = endDate
        self.exerciseDates = exerciseDates
    }
}
