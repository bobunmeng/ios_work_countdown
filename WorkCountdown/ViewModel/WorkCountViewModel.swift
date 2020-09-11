//
//  WorkCountViewModel.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 02.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import Foundation

class WorkCountViewModel {
    
    var workCounts: [WorkCount] = []
    private var workCount: WorkCount = WorkCount()
    private var timeModel: TimeModel = TimeModel()
    
    var timeDisplay: String {
        return [timeModel.hour, timeModel.minute, timeModel.second].map ({ value -> String in
            if value < 10 {
                return "0\(value)"
            }
            return "\(value)"
            }).joined(separator: ":")
    }
    
    var incomeDisplay: String {
        return workCount.incomeDisp
    }
    
    func updateTimer() {
        timeModel.second += 240
        workCount.income = round(Double(timeModel.totalInSecond) / 3600 * Double(Constants.WAGEPERHOUR))
    }
    
    func resetWorkCount() {
        timeModel.hour = 0
        timeModel.minute = 0
        timeModel.second = 0
        
        workCount.income = 0
    }
    
    func save() {
        let works = self.workCounts.filter { $0 == workCount }
        if works.isEmpty {
            self.workCounts.append(WorkCount(date: workCount.date, time: timeModel.totalInHour, income: workCount.income))
        } else {
            self.workCounts.filter { $0 == workCount }.forEach {
                $0.income += workCount.income
                $0.time += timeModel.totalInHour
            }
        }
        self.resetWorkCount()
    }
    
}
