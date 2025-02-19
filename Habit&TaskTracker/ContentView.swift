//
//  ContentView.swift
//  Habit&TaskTracker
//
//  Created by Divyansh Dwivedi on 15/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeScreen()
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
