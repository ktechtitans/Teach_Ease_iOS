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
    let allCourses: [CourseModel] = sampleCourses + sampleScienceCourses

    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .focused($isSearchFieldFocused)

            ScrollView {
                let filteredCourses = allCourses.filter { course in
                    course.title.localizedCaseInsensitiveContains(searchText) ||
                    course.description.localizedCaseInsensitiveContains(searchText)
                }

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
            isSearchFieldFocused = true
        }
    }
}



#Preview {
    SearchPageView()
}
