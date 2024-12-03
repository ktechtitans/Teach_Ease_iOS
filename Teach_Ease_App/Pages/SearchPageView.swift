//
//  SearchPageView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI

struct SearchPageView: View {
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // Simple Search Bar
                TextField("Search for a course", text: $searchQuery)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Search Courses")
        }
    }
}

#Preview {
    SearchPageView()
}
