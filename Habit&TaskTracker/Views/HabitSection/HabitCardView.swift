//
//  HabitCardView.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 16/06/22.
//

import SwiftUI
import RealmSwift

struct HabitCardView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    var habit: String
    var completed : Bool
    var id: ObjectId

  let randomImg = Int.random(in: 1..<11)
   
   
var body: some View {
    
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                            Image(systemName: "minus.circle")
                            .foregroundColor(.gray)
                                   .font(.system(size: 15))
                                   .padding(.trailing, 2)
                                   .onTapGesture {
                                       realmManager.deleteHabit(id: id)
                                   }
                        
                    }
                    Image("\(randomImg)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 70, alignment: .center)
                    HStack(spacing: 0) {
                        Image(systemName: completed ? "checkmark.seal.fill" : "seal")
                               .foregroundColor(completed ? .green : Color("color"))
                               .frame(width: 20, height: 30)
//                               .onTapGesture {
//                                   realmManager.updateTask(id: id, completed: completed)
//                               }
                    NavigationLink {
                        HabitProgressView( habit: habit, completed: completed)
                    } label: {
                   
                        Text(habit)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.all, 4)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .black.opacity(0.3), radius: 4, x: 4, y: 4)
                                .shadow(color: .white.opacity(0.5), radius: 4, x: -4, y: -4)
                                .frame(width: 130, height: 30, alignment: .center)
                                .padding(.vertical,3)

                    }
           
                    }
                }
            }

            .frame(width: 150, height: 150, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.all, 6)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 4, x: 4, y: 4)
            .shadow(color: .white.opacity(0.5), radius: 6, x: -6, y: -6)
        }
    }


//struct HabitCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        HabitCardView(habit: "Drink Water", completed: true)
//            .environmentObject(RealmManager())
//    }
//}
