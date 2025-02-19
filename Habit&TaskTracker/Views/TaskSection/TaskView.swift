//
//  TaskView.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 16/06/22.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title2).bold()
                .padding(.horizontal)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .padding(.trailing,30)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listSectionSeparator(.hidden)
                .listRowSeparator(.hidden)
            }
            
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            
            Spacer()
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
