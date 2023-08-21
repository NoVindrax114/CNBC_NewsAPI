//
//  String+DateFormatter.swift
//  News-Vindra
//
//  Created by Samudra Putra on 19/08/23.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM d, y h:mm a"
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
    func formattedDateShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM d, y"
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
}
