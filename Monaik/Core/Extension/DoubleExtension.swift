//
//  StringExtension.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

extension Double {
    var toFormattedVo2: String {
        return String(format: "%.1f ml/min/kg", self)
    }
}
