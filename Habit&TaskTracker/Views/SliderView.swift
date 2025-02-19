//
//  SliderView.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 16/06/22.
//

import SwiftUI

struct SliderView: View {
    
    @State var isHabit: Bool
    @State var isTask: Bool
    
    var body: some View {
        HStack(spacing:0) {
            NavigationLink {
                HabitScreen()
            } label: {
                HStack {
                   Image(systemName: "repeat")
                    Text("Habits")
                }
                .foregroundColor(isHabit ? .white : .black)
                .font(.system(size: 20, weight: .medium, design: .serif))
                .frame(width: 150, height: 60, alignment: .center)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .fill(
                                (isHabit ? Color("color") : .clear)
                            )
                            .padding(2)
                    }
                
                )

            }.transition(AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
               
            
            NavigationLink {
                taskScreen()
            } label: {
                HStack {
                    Image(systemName: "doc.text")
                    Text("Tasks")
                       
                }
                .foregroundColor(isTask ? .white : .black)
                .font(.system(size: 20, weight: .medium, design: .serif))
                .frame(width: 150, height: 60, alignment: .center)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .fill(
                                (isTask ? Color("color") : .clear)
                            )
                            .padding(2)
                          
                    }
                
                )

            }.transition(AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))

        }
        .frame(width: 300, height: 60)
        .background(.white.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
        .shadow(color: Color.white.opacity(0.5), radius: 10, x: -10, y: -10)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(isHabit: false, isTask: false)
    }
}
