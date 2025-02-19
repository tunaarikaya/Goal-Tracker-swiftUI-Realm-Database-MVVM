//
//  Habit.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 17/06/22.
//

import Foundation
import RealmSwift

class Habit: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed  = false
    
}
