//
//  AddTaskScreen.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 20/06/22.
//

import SwiftUI

struct AddTaskScreen: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow.opacity(0.2), .orange.opacity(0.5)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            Image("task")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text("Add Your Task")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Enter your task here",
                    text: $title
                ).textFieldStyle(.roundedBorder)
                
                Spacer()
                Button {
               
                    if title != "" {
                        realmManager.addTask(taskTitle: title)
                    }
                    dismiss()
                } label: {
                 SmallAddButton(title: "Add")
                }
               
            }
            .padding(.top, 40)
            .padding(.horizontal)
        }
    }
}

struct AddTaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskScreen()
            .environmentObject(RealmManager())
    }
}
