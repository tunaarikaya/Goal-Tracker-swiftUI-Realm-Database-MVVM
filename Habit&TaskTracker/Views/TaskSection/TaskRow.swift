//
//  TaskRow.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 16/06/22.
//

import SwiftUI

struct TaskRow: View {
    
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            
          RoundedRectangle(cornerRadius: 5)
                .fill(Color("color"))
                .frame(width: 8, height: 50, alignment: .center)
            VStack(alignment:.leading,spacing: 6) {
                Text("You Got This")
                    .font(.system(size: 15, weight: .light, design: .default))
                Text(task)
                    .font(.system(size: 20, weight: .regular, design: .serif))
            }
            
            Spacer()
            Image(systemName: completed ? "checkmark.square.fill" : "square")
                .foregroundColor(completed ? .green : Color("color"))
                .font(.title2)
                
                
        }.padding()
            .frame(width: 340, height: 50, alignment: .center)
            .background(.clear)
        
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Code", completed: true)
    }
}
