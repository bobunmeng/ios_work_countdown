//
//  Date+Extension.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 02.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

extension Date {
    
    var display: String {
        return MyFunctions.stringFromDate(self)
    }
    
}
