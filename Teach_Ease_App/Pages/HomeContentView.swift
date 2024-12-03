//
//  HomeContentView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI
import FirebaseFirestore

struct HomeContentView: View {
    @State private var categories: [Category] = []
    @State private var isLoading: Bool = true
    
    private var db = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("TeachEase")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.top, 40)
                    Spacer()
                    Text("Welcome!")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .padding(.top, 40)
                }
                .padding()

                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .padding()
                } else {
                    ScrollView {
                       
                        ForEach(categories) { category in
                            VStack(alignment: .leading) {
                                Text(category.title)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.top)
                                
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 16) {
                                        ForEach(category.courses) { course in
                                            NavigationLink(destination: CourseDetailView(course: course)) {
                                                CategoryCard(course: course)
                                            }
                                        }
                                    }
                                    .padding(.bottom)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        db.collection("categories").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching categories: \(error.localizedDescription)")
                self.isLoading = false
                return
            }
            
            var loadedCategories: [Category] = []
            
            for document in snapshot!.documents {
                let categoryId = document.documentID
                let title = document["title"] as? String ?? "Untitled Category"
                
                
                db.collection("categories").document(categoryId).collection("courses").getDocuments { courseSnapshot, error in
                    if let error = error {
                        print("Error fetching courses: \(error.localizedDescription)")
                        return
                    }
                    
                    var courses: [Course] = []
                    for courseDocument in courseSnapshot!.documents {
                        let courseName = courseDocument["courseName"] as? String ?? "Unnamed Course"
                        let courseDescription = courseDocument["courseDescription"] as? String ?? ""
                        let imageUrl = courseDocument["imageUrl"] as? String ?? ""
                        
                        let course = Course(id: courseDocument.documentID, courseName: courseName, courseDescription: courseDescription, imageUrl: imageUrl)
                        courses.append(course)
                    }
                    
                  
                    let category = Category(id: categoryId, title: title, courses: courses)
                    loadedCategories.append(category)
                    
                   
                    if loadedCategories.count == snapshot!.documents.count {
                        self.categories = loadedCategories
                        self.isLoading = false
                    }
                }
            }
        }
    }
}

struct CategoryCard: View {
    var course: Course
    
    var body: some View {
        VStack {
          
            if let url = URL(string: course.imageUrl), !course.imageUrl.isEmpty {
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 160, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                Color.gray
                    .frame(width: 160, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            VStack(alignment: .leading, spacing: 4) {
               
                Text(course.courseName)
                    .font(.system(size: 16, weight: .bold))
                    .lineLimit(1)
                    .frame(maxWidth: 160, alignment: .leading)
                
                Text(course.courseDescription)
                    .font(.system(size: 12))
                    .lineLimit(2)
                    .foregroundColor(.gray)
                    .frame(maxWidth: 160, alignment: .leading)
            }
            .padding(8)
        }
        .frame(width: 160, height: 220)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

struct CourseDetailView: View {
    var course: Course
    
    var body: some View {
        ScrollView {
            VStack {
                if let url = URL(string: course.imageUrl), !course.imageUrl.isEmpty {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 250)
                } else {
                    Color.gray
                        .frame(height: 250)
                }

                Text(course.courseName)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 16)
                
                Text(course.courseDescription)
                    .font(.system(size: 16))
                    .padding(.top, 8)
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding()
            .navigationTitle(course.courseName) 
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

