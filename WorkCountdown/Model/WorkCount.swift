//
//  Income.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 02.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import Foundation
import RealmSwift

class WorkCount: Object {
    
    @objc private dynamic var identifier: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var time: Double = 0.0
    @objc dynamic var income: Double = 0.0
    
    override class func primaryKey() -> String? {
        return "identifier"
    }
    
    required init() {
        self.date = Date()
        self.identifier = self.date.display
        self.time = 0.0
        self.income = 0.0
    }
    
    init(date: Date, time: Double, income: Double) {
        self.identifier = date.display
        self.date = date
        self.time = time
        self.income = income
    }
    
    var dateDisp: String {
        return self.date.display
    }
    
    var timeDisp: String {
        return "\(time)h"
    }
    
    var incomeDisp: String {
        return "\(income) Kč"
    }
    
    static func == (lhs: WorkCount, rhs: WorkCount) -> Bool {
        return lhs.dateDisp == rhs.dateDisp
    }
    
}
