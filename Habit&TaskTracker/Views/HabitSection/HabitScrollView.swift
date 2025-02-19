//
//  HabitScrollView.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 17/06/22.
//

import SwiftUI

struct HabitScrollView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing:20 ) {
                ForEach(realmManager.habits, id: \.id) { habit in
                    if !habit.isInvalidated {
                        HabitCardView(habit: habit.title , completed: habit.completed, id: habit.id)
                            .onTapGesture {
                                realmManager.updateHabit(id: habit.id, completed: !habit.completed)
                            }
                    }
                }
            }.padding()
            
            
        }
    }
}

struct HabitScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HabitScrollView()
            .environmentObject(RealmManager())
    }
}
