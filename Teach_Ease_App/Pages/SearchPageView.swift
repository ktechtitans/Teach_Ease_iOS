//
//  SearchPageView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI

struct SearchPageView: View {
    @State private var searchText: String = ""
    @FocusState private var isSearchFieldFocused: Bool
    let allCourses: [CourseModel] = sampleCourses + sampleScienceCourses // Combine all courses

    var body: some View {
        VStack {
            // Search Field
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .focused($isSearchFieldFocused)

            // Displaying Search Results
            ScrollView {
                let filteredCourses = allCourses.filter { course in
                    course.title.localizedCaseInsensitiveContains(searchText) ||
                    course.description.localizedCaseInsensitiveContains(searchText)
                }

                // Display filtered courses or a message if none are found
                ForEach(filteredCourses) { course in
                    CourseCard(course: course)
                        .padding(.horizontal)
                }

                if filteredCourses.isEmpty && !searchText.isEmpty {
                    Text("No results found for \"\(searchText)\".")
                        .padding()
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Automatically focus on the search field when the view appears
            isSearchFieldFocused = true
        }
    }
}



#Preview {
    SearchPageView()
}
