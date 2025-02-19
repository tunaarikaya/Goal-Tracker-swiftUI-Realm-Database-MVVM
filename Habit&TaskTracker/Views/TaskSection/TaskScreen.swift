//
//  taskScreen.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 15/06/22.
//

import SwiftUI

struct taskScreen: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false

    var body: some View {
       
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow.opacity(0.2), .orange.opacity(0.5)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            VStack {
                SliderView(isHabit: false, isTask: true)
                CalenderView(calendar: Calendar(identifier: .gregorian))
                Spacer()
                VStack {
                    TasksView()
                        .environmentObject(realmManager)
                    
                    SmallAddButton(title: "Add Your Task")
                        .padding()
                        .onTapGesture {
                            showAddTaskView.toggle()
                        }
                }
                .sheet(isPresented: $showAddTaskView) {
                    AddTaskScreen()
                        .environmentObject(realmManager)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .background(.clear)
            }  .navigationBarHidden(true)
        }.swipeActions(edge: .leading, allowsFullSwipe: true, content: {
            HabitScreen()
        })
        
    }
}

struct taskScreen_Previews: PreviewProvider {
    static var previews: some View {
        taskScreen()
            .environmentObject(RealmManager())
    }
}
struct SmallAddButton: View {
    @State var title: String
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold, design: .serif))
                    .padding()

            }
                .padding(.horizontal)
                .frame(width: 300, height: 50, alignment: .center)
                .background(Color("color"))
                .cornerRadius(30)
        }
        .frame(height: 50)
    }
}
