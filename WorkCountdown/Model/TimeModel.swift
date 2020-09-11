//
//  TimeModel.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 02.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import Foundation

class TimeModel {
    var hour: Int = 0
    var minute: Int = 0
    var second: Int = 0 {
        didSet {
            self.update()
        }
    }
    
    init() {
        self.hour = 0
        self.minute = 0
        self.second = 0
    }
    
    var totalInSecond: Int {
        return hour * 3600 + minute * 60 + second
    }
    
    var totalInHour: Double {
        let scale: Int16 = 3
        let behavior = NSDecimalNumberHandler(roundingMode: .plain, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        let hrs = Double(self.totalInSecond) / 3600
        return Double(truncating: NSDecimalNumber(value: hrs).rounding(accordingToBehavior: behavior))
    }
    
    func update() {
        if second >= 60 {
            self.minute += second / 60
            self.second = second % 60
        }
        
        if minute >= 60 {
            self.hour += minute / 60
            self.minute = minute % 60
        }
    }
    
}
