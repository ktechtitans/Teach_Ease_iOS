//
//  HomeContentView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI


// Sample featured course data
let featuredCourse = CourseModel(
    title: "Swift Programming",
    description: "Master iOS development with Swift.",
    image: "Swift_Language" // Make sure this image is in the assets
)

let sampleCourses: [CourseModel] = [
    CourseModel(title: "C Programming", description: "Learn the basics of C programming.", image: "C_Language"),
    CourseModel(title: "C++ Programming", description: "Explore object-oriented programming with C++.", image: "C++_Language"),
    CourseModel(title: "R Programming", description: "Data analysis and visualization with R.", image: "R_Language")
]

// Sample science course data
let sampleScienceCourses: [CourseModel] = [
    CourseModel(title: "Physics", description: "Learn the fundamentals of physics.", image: "Physics_Image"),
    CourseModel(title: "Chemistry", description: "Explore the world of chemistry.", image: "Chemistry_Image"),
    CourseModel(title: "Biology", description: "Discover the science of living organisms.", image: "Biology_Image")
]

struct HomeContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Fixed Title Section
            HStack {
                Text("TeachEase")
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.vertical, 70)
                    .padding(.bottom, -40)

                Spacer()

                Text("Welcome!")
                    .font(.title3)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.bottom, -40)
                
            }
            .padding()
            .background(Color.white) // Background color for title section

            Divider() // Add a divider to separate title from content

            // Scrollable Content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Featured Course Section
                    FeaturedCourseView(course: featuredCourse)
                        .padding(.horizontal, 20)

                    // Programming Courses Section Title
                    Text("Programming Categories")
                        .font(.headline)
                        .padding(.horizontal, 20)

                    // Programming Courses Section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(sampleCourses) { course in
                                CourseCard(course: course)
                                    .frame(width: 220)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)

                    // Science Courses Section Title
                    Text("Science Categories")
                        .font(.headline)
                        .padding(.horizontal, 20)

                    // Science Courses Section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(sampleScienceCourses) { course in
                                CourseCard(course: course)
                                    .frame(width: 220)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)
                }
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .ignoresSafeArea(edges: .top) // Ensures the content aligns with the top of the screen
    }
}


// Custom view for displaying the featured course
struct FeaturedCourseView: View {
    let course: CourseModel
    
    var body: some View {
        ZStack {
            Image(course.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(12)
                .overlay(
                    Color.black.opacity(0.4)
                        .cornerRadius(12)
                )

            VStack(alignment: .leading, spacing: 8) {
                Text(course.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(course.description)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// Custom view for displaying each course
struct CourseCard: View {
    let course: CourseModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(course.image)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .cornerRadius(10)

            Text(course.title)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(1)

            Text(course.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    HomeContentView()
}
