
//
//  WorkCountDataStore.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 12.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import Foundation
import RealmSwift

class WorkCountDataStore {
    
    static var shared = WorkCountDataStore()
    private var _realm: Realm!
    
    private init() {
        do {
            self._realm = try Realm()
        } catch {
            fatalError()
        }
    }
    
    func save(_ workCount: WorkCount) -> WorkCount? {
        do {
            try self._realm.write {
                self._realm.add(workCount, update: .modified)
            }
        } catch(let error) {
            print("WorkCount Save Error: \(error.localizedDescription)")
            return nil
        }
        return workCount
    }
    
    func save(_ workCounts: [WorkCount]) -> [WorkCount] {
        var savedWorks: [WorkCount] = []
        for workCount in workCounts {
            guard let workSaved = self.save(workCount) else { continue }
            savedWorks.append(workSaved)
        }
        return savedWorks
    }
    
    func get(byId id: Int) -> WorkCount? {
        let predicate = NSPredicate(format: "identifier: %@", id)
        let workCount = _realm.objects(WorkCount.self).filter(predicate).first
        return workCount
    }
    
    func get() -> [WorkCount] {
        let workCounts = _realm.objects(WorkCount.self)
        return workCounts.compactMap { $0 }
    }
    
}
