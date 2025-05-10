//
//  WorkoutPlannerUtil.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import Foundation

class WorkoutPlannerUtil {
    static func generateWorkoutPlan(startDate: Date, endDate: Date) -> [ExerciseWeekModel] {
        let calendar = Calendar.current
        var workoutWeeks = [ExerciseWeekModel]()
        var currentDate = startDate
        var weekNumber = 1
        
        while currentDate <= endDate {
            // Dapatkan tanggal awal dan akhir minggu ini
            let weekStart = currentDate
            let weekEnd = calendar.date(byAdding: .day, value: 6, to: weekStart)!
            
            // Tentukan exercises aktif untuk minggu ini
            let activeExercises = getActiveExercises(for: weekNumber)
            let dailyExercises = scheduleExercisesForWeek(activeExercises: activeExercises)
            
            // Buat array ExerciseDate untuk minggu ini
            var weekExercises = [ExerciseDate]()
            var dayCounter = 0
            var dateInWeek = weekStart
            
            while dayCounter < 7 && dateInWeek <= endDate {
                let exercise = dailyExercises[dayCounter]
                weekExercises.append(ExerciseDate(date: dateInWeek, exercise: exercise))
                dateInWeek = calendar.date(byAdding: .day, value: 1, to: dateInWeek)!
                dayCounter += 1
            }
            
            // Buat ExerciseWeek dan tambahkan ke array
            let exerciseWeek = ExerciseWeekModel(
                number: weekNumber,
                startDate: weekStart,
                endDate: min(weekEnd, endDate),
                exerciseDates: weekExercises
            )
            workoutWeeks.append(exerciseWeek)
            
            // Pindah ke minggu berikutnya
            currentDate = calendar.date(byAdding: .weekOfYear, value: 1, to: weekStart)!
            weekNumber += 1
        }
        
        return workoutWeeks
    }
    
    static func generateDummy() -> [ExerciseWeekModel] {
        let calendar = Calendar.current
        let startDate = Date()
//        let startDate = calendar.date(from: DateComponents(year: 2025, month: 5, day: 10))!
        let endDate = calendar.date(from: DateComponents(year: 2025, month: 5, day: 30))!

        return WorkoutPlannerUtil.generateWorkoutPlan(startDate: startDate, endDate: endDate)
    }
    
    private static func getActiveExercises(for weekNumber: Int) -> [Exercise] {
        return Exercise.allExercises.filter { exercise in
            let startValid = exercise.startWeek == nil || exercise.startWeek! <= weekNumber
            let endValid = exercise.endWeek == nil || exercise.endWeek! >= weekNumber
            return startValid && endValid
        }
    }
    
    private static func scheduleExercisesForWeek(activeExercises: [Exercise]) -> [Exercise] {
        var exerciseCounts = [Exercise: Int]()
        for exercise in activeExercises {
            exerciseCounts[exercise] = exercise.timesAWeek
        }
        
        var weekSchedule = [Exercise]()
        var daysScheduled = 0
        
        // Prioritaskan HIIT dan Aerobic
        let priorityExercises = activeExercises.filter { $0.type == .hiit || $0.type == .aerobic }
        for exercise in priorityExercises {
            while exerciseCounts[exercise]! > 0 && daysScheduled < 7 {
                weekSchedule.append(exercise)
                exerciseCounts[exercise]! -= 1
                daysScheduled += 1
            }
        }
        
        // Tambahkan active rest
        let restExercises = activeExercises.filter { $0.type == .activeRest }
        for exercise in restExercises {
            while exerciseCounts[exercise]! > 0 && daysScheduled < 7 {
                weekSchedule.append(exercise)
                exerciseCounts[exercise]! -= 1
                daysScheduled += 1
            }
        }
        
        // Isi sisa hari dengan istirahat
        while daysScheduled < 7 {
            weekSchedule.append(.enjoying)
            daysScheduled += 1
        }
        
        // shuffle
        let shuffled = weekSchedule.shuffled()
        
        // hindari HIIT berturut-turut
        return avoidConsecutiveHIIT(schedule: shuffled)
    }
    
    private static func avoidConsecutiveHIIT(schedule: [Exercise]) -> [Exercise] {
        var adjustedSchedule = schedule
        for i in 1..<adjustedSchedule.count {
            if adjustedSchedule[i].type == .hiit && adjustedSchedule[i-1].type == .hiit {
                if let swapIndex = adjustedSchedule.indices.first(where: {
                    $0 > i && adjustedSchedule[$0].type != .hiit
                }) {
                    adjustedSchedule.swapAt(i, swapIndex)
                }
            }
        }
        return adjustedSchedule
    }
}
