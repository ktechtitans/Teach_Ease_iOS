//
//  ContentView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State var isLoggedIn = Auth.auth().currentUser != nil

    var body: some View {
          
                RegisterView()
                    .navigationBarHidden(true)
            
        }
    
   }

#Preview {
    ContentView()
}
