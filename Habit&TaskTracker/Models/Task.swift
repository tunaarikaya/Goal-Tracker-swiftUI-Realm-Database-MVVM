//
//  Task.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 16/06/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId // This is our primary key, and each Task instance can be uniquely identified by the ID
    @Persisted var title = ""
    @Persisted var completed = false
}
