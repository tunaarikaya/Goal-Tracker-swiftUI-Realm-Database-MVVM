//
//  HabitScreen.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 15/06/22.
//

import SwiftUI

struct HabitScreen: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
       
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.yellow.opacity(0.2), .orange.opacity(0.5)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    SliderView(isHabit: true, isTask: false)
                    CalenderView(calendar: Calendar(identifier: .gregorian))
                    Spacer()
                    VStack {
                        HabitScrollView()
                            .environmentObject(realmManager)
                        
                        SmallAddButton(title: "Add Your Goal")
                            .padding()
                            .onTapGesture {
                                showAddTaskView.toggle()
                            }
                    }
                    .sheet(isPresented: $showAddTaskView) {
                       AddHabitView()
                            .environmentObject(realmManager)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
            }
          
            .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                taskScreen()
            })
            .navigationBarHidden(true)

    }
}

struct HabitScreen_Previews: PreviewProvider {
    static var previews: some View {
        HabitScreen()
            .environmentObject(RealmManager())
    }
}
