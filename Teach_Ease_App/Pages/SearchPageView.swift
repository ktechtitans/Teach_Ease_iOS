//
//  SearchPageView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI
import FirebaseFirestore

struct SearchPageView: View {
    @State private var searchQuery: String = ""
    @State private var allCourses: [Course] = []
    @State private var filteredCourses: [Course] = []
    @State private var isLoading: Bool = true

    private var db = Firestore.firestore()

    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Search for a course", text: $searchQuery)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.horizontal)
                    .onChange(of: searchQuery) { _ in
                        filterCourses()
                    }

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .padding()
                } else if filteredCourses.isEmpty {
                    Text("No courses found")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(filteredCourses) { course in
                                NavigationLink(destination: CourseDetailView(course: course)) {
                                    CategoryCard(course: course)
                                        .frame(width: 180)
                                }
                            }
                        }
                        .padding()
                    }
                }

                Spacer()
            }
            .navigationTitle("Search Courses")
            .onAppear(perform: loadData)
        }
    }

    
    func loadData() {
        db.collectionGroup("courses").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching courses: \(error.localizedDescription)")
                self.isLoading = false
                return
            }

            var loadedCourses: [Course] = []

            for document in snapshot!.documents {
                let courseName = document["courseName"] as? String ?? "Unnamed Course"
                let courseDescription = document["courseDescription"] as? String ?? ""
                let imageUrl = document["imageUrl"] as? String ?? ""

                let course = Course(id: document.documentID, courseName: courseName, courseDescription: courseDescription, imageUrl: imageUrl)
                loadedCourses.append(course)
            }

            self.allCourses = loadedCourses
            self.filteredCourses = loadedCourses
            self.isLoading = false
        }
    }

    
    func filterCourses() {
        if searchQuery.isEmpty {
            filteredCourses = allCourses
        } else {
            filteredCourses = allCourses.filter { $0.courseName.lowercased().contains(searchQuery.lowercased()) }
        }
    }
}



#Preview {
    SearchPageView()
}
