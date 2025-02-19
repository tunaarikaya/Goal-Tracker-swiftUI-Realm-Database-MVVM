//
//  AddHabitView.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 17/06/22.
//

import SwiftUI

struct AddHabitView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow.opacity(0.2), .orange.opacity(0.5)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            Image("goal")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text("Add Your Goal")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField(
                    "Enter your goal here",
                    text: $title
                ).textFieldStyle(.roundedBorder)
                
                Spacer()
                Button {
               
                    if title != "" {
                        realmManager.addHabit(habitTitle: title)
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

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
            .environmentObject(RealmManager())
    }
}
