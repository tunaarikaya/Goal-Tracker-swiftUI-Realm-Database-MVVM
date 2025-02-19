//
//  HabitProgressView.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 15/06/22.
//

import SwiftUI
import RealmSwift


struct HabitProgressView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @State var habit: String
    @State var completed: Bool = false


    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow.opacity(0.2), .orange.opacity(0.5)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
    
            VStack {
                Image("progress")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: .infinity, alignment: .top)
                VStack(alignment: .leading) {
                    HStack(spacing: 20) {
                        Image(systemName: "calendar.circle.fill")
                            .font(.system(size: 50))
                            .padding(.leading)
                    
                        VStack(alignment:.leading ,spacing: 8) {
                            let date = getDate()
                            Text("Date & Time").font(.system(size: 15, weight: .regular, design: .serif))
                            Text(date).font(.system(size: 20, weight: .medium, design: .serif))
                        }.padding(.vertical,8)
                        Spacer()
                        
                    }
                 
                    .background(.pink.opacity(0.13))
                    .edgesIgnoringSafeArea(.all)
                  
                    Divider()
                    Text("\(habit) Preview")
                        .font(.system(size: 22, weight: .semibold, design: .serif))
                        .padding()
                    HStack {
                        ZStack {
                          
                            Circle()
                                .stroke(Color("color"), style: StrokeStyle(lineWidth: 10, lineCap: .round))

                            Image(systemName: completed ? "hands.sparkles.fill" : "hand.thumbsdown.fill")
                                .foregroundColor(completed ? Color("color") : .red)
                                .padding()
                                .font(.system(size: 30, weight: .black, design: .serif))
                                .background(.pink.opacity(0.13))
                                .clipShape(Circle())
                               
                        
                        }
                            .clipShape(Circle())
                            .padding(.all, 4)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
                            .shadow(color: .white.opacity(0.5), radius: 10, x: -10, y: -10)
                        
                        .frame(width: 120, height: 100, alignment: .center)
                        .padding()
                        
                        VStack {
                            HStack(spacing: 2) {
                                Image(systemName: completed ? "flame.fill" : "cloud.moon.bolt.fill")
                                    .foregroundColor(completed ? .red : .teal)
                                    .frame(width: 30, height: 30)
                                
                                Text(completed ? "Keep It Up" : "Try Hard")
                                    .font(.system(size: 20))
                                    .frame(width: 120, height: 30, alignment: .leading)
                                    
                                
                            }
                            Divider()
                            
                            HStack(spacing: 2) {
                                Image(systemName: completed ? "checkmark.square.fill" : "square")
                                       .foregroundColor(completed ? .green : Color("color"))
                                       .frame(width: 30, height: 30)

                                    Text("Completed")
                                    .font(.system(size: 20))
                                    .frame(width: 120, height: 30, alignment: .leading)
                                
                            }
                        }
                       
                        .frame(width: 150, height: 80, alignment: .leading)
                        .padding()
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("color"))
                            .frame(width: 300, height: 50, alignment: .center)
                            .overlay(
                            Text("Okay, Go Back")
                                .font(.system(size: 20, weight: .medium, design: .serif))
                                .foregroundColor(.white)
                            )
                            .padding()
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
                            .shadow(color: .white.opacity(0.5), radius: 10, x: -10, y: -10)
                            .padding(.leading, 22)
                    }

                }
                .frame(width: 350, height: .infinity, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 28))
                    .padding(.all, 6)
                    .background(.white.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 28))
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 4, y: 4)
                    .shadow(color: .white.opacity(0.5), radius: 6, x: -6, y: -6)
    
             
            }
        }.navigationBarHidden(true)
    }


    func getDate() -> String {
        let mytime = Date()
        let format = DateFormatter()
        format.timeStyle = .none
        format.dateStyle = .long
        return(format.string(from: mytime))
    }
}

struct HabitProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HabitProgressView(habit: "Code", completed: true)
    }
}
