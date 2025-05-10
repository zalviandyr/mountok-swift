//
//  Exercise.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import Foundation

enum ExerciseType: Codable {
    case aerobic, hiit, activeRest, rest
}

struct Exercise: Hashable, Codable {
    var id: String = UUID().uuidString
    let name: String
    let description: String
    let duration: String?
    let icon: String
    let type: ExerciseType
    let timesAWeek: Int
    let startWeek: Int?
    let endWeek: Int?
    
    static let shortHiit: Exercise = Exercise(
        name: "Short HIIT",
        description: "15 sec run at 90-95 HRMax\n15 sec walk at 70 HRMax",
        duration: "47 Set (~25 Minute)",
        icon: "figure.highintensity.intervaltraining",
        type: ExerciseType.hiit,
        timesAWeek: 3,
        startWeek: 5,
        endWeek: 14
    )
    
    static let longHiit: Exercise = Exercise(
        name: "Long HIIT",
        description: "4 min run at 90-95 HRMax\n3 min walk at 70 HRMax",
        duration: "4 Set (~25 Minute)",
        icon: "figure.highintensity.intervaltraining",
        type: ExerciseType.hiit,
        timesAWeek: 3,
        startWeek: 15,
        endWeek: nil
    )
    
    static let walking: Exercise = Exercise(
        name: "Walking",
        description: "Just walking around to recovery",
        duration: "30 Minute",
        icon: "figure.walk",
        type: ExerciseType.activeRest,
        timesAWeek: 1,
        startWeek: nil,
        endWeek: nil
    )
    
    static let briskWalking: Exercise = Exercise(
        name: "Brisk Walking",
        description: "Just walking with a brisk pace",
        duration: "30 Minute",
        icon: "figure.walk.motion",
        type: ExerciseType.activeRest,
        timesAWeek: 1,
        startWeek: nil,
        endWeek: nil
    )
    
    static let enjoying: Exercise = Exercise(
        name: "Enjoying",
        description: "Just enjoying your day",
        duration: nil,
        icon: "bed.double.fill",
        type: ExerciseType.rest,
        timesAWeek: 1,
        startWeek: nil,
        endWeek: nil
    )
    
    static let skipping: Exercise = Exercise(
        name: "Skipping",
        description: "It can help improve your foot strength",
        duration: "30 Minute",
        icon: "figure.jumprope",
        type: ExerciseType.aerobic,
        timesAWeek: 3,
        startWeek: 1,
        endWeek: 4
    )
    
    static let jogging: Exercise = Exercise(
        name: "Jogging",
        description: "To improve your cardiovascular fitness",
        duration: "30 Minute",
        icon: "figure.run",
        type: ExerciseType.aerobic,
        timesAWeek: 3,
        startWeek: 1,
        endWeek: 4
    )
    
    static let allExercises: [Exercise] = [
        .shortHiit, .longHiit, .walking,
        .briskWalking, .enjoying, .skipping,
        .jogging
    ]
}
