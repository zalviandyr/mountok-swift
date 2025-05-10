//
//  Province.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import Foundation

struct Province: Identifiable {
    let id: UUID = UUID()
    let name: String
    let mountains: Array<Mountain>
}
