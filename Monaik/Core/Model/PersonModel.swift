//
//  Person.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import Foundation
import SwiftData

@Model
class PersonModel {
    var baseVo2: Double
    var targetVo2: Double
    var mountainVo2: Double
    var mountain: Mountain
    var departDate: Date
    
    init(baseVo2: Double, targetVo2: Double, mountainVo2: Double, mountain: Mountain, departDate: Date) {
        self.baseVo2 = baseVo2
        self.targetVo2 = targetVo2
        self.mountainVo2 = mountainVo2
        self.mountain = mountain
        self.departDate = departDate
    }
    
    static func empty() -> PersonModel {
        return PersonModel(
            baseVo2: 0,
            targetVo2: 0,
            mountainVo2: 0,
            mountain: Mountain(name: "", elevation: 0),
            departDate: Date()
        )
    }
}
