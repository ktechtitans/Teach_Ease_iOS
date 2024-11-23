//
//  HomePageView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeContentView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            NavigationStack {
                SearchPageView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }

            NavigationStack {
                ProfileView() 
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}

#Preview {
    HomePageView()
}
