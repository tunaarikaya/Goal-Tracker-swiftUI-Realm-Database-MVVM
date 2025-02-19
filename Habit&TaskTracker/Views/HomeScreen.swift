//
//  HomeScreen.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 15/06/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow.opacity(0.5), .orange]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)

            
            Image("Home")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .offset(x:50, y: -350)
                .rotationEffect(.degrees(30))
                .shadow(color: .red, radius: 8)
            


            Image("Home")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .offset(x:-150, y: 400)
                .rotation3DEffect(.degrees(45), axis: (x: 0, y: 0, z: 0))
                .shadow(color: .red, radius: 8)


            Rectangle()
                .fill(.white.opacity(0.17))
                .ignoresSafeArea()
            VStack(alignment: .center) {
                
                Spacer()
                Image("img")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 30) {
                    Text("Convenient and productive Habit / Task manager.")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                                               
                    Text("We have created an intuitive and convenient interface for teamwork.")
                        .font(.system(size: 17, weight: .regular, design: .serif))
                      
                }
                .frame(width: 370, height: 200)
                .padding(.horizontal)
              
                
                NavigationLink {
                    HabitScreen()
                }
            label: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white.opacity(0.6))
                        .frame(width: 300, height: 70, alignment: .center)
                        .overlay(
                        Text("Get Started\t >>")
                            .font(.system(size: 20, weight: .medium, design: .serif))
                            .foregroundColor(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        )
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                        .shadow(color: .white.opacity(0.8), radius: 7, x: -7, y: -7)
                        .padding(.top, 20)
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .padding()
          
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreen()
        }
       
    }
}
