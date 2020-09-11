//
//  CommonFunctions.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 02.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

struct MyFunctions {
    
    private static let defaultDateFormat = "dd/MM/yyyy"
    
    private static func dateFormatter(ofFormat format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    static func stringFromDate(_ date: Date, _ format: String = defaultDateFormat) -> String {
        let formatter = dateFormatter(ofFormat: format)
        return formatter.string(from: date)
    }
    
    static func dateFromString(_ str: String, _ format: String = defaultDateFormat) -> Date? {
        let formatter = dateFormatter(ofFormat: format)
        return formatter.date(from: str)
    }
    
}
