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
            // Home Tab
            NavigationStack {
                HomeContentView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            // Search Tab
            NavigationStack {
                SearchPageView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }

            // Profile Tab with Direct Content
            NavigationStack {
                VStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .padding()

                    
                }
                .padding()
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
