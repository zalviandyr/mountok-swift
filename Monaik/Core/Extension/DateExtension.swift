//
//  DateExtension.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import Foundation

extension Date {
    var toDateAndTimeString: String {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()
        
        return dateFormatter.string(from: self)
    }
    
    var toLongDateString: String {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
        
        return dateFormatter.string(from: self)
    }
}
