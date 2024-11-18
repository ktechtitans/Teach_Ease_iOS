//
//  CourseModel.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import Foundation

// MARK: - CourseModel
// Data model for a Course with identifiable fields.
// The 'id' is unique for each course to make it identifiable in SwiftUI.
struct CourseModel: Identifiable {
    let id: UUID // Using UUID to ensure each CourseModel is uniquely identifiable
    let title: String
    let description: String
    let image: String // Image name from assets folder
}

// Sample data for testing UI components
let featuredCourse = CourseModel(
    id: UUID(), // Assign unique ID
    title: "Swift Programming",
    description: "Master iOS development with Swift.",
    image: "Swift_Language"
)

// Sample programming courses for demonstration purposes
let sampleCourses: [CourseModel] = [
    CourseModel(id: UUID(), title: "C Programming", description: "Learn the basics of C programming.", image: "C_Language"),
    CourseModel(id: UUID(), title: "C++ Programming", description: "Explore object-oriented programming with C++.", image: "C++_Language"),
    CourseModel(id: UUID(), title: "R Programming", description: "Data analysis and visualization with R.", image: "R_Language")
]

// Sample science courses for demonstration purposes
let sampleScienceCourses: [CourseModel] = [
    CourseModel(id: UUID(), title: "Physics", description: "Learn the fundamentals of physics.", image: "Physics_Image"),
    CourseModel(id: UUID(), title: "Chemistry", description: "Explore the world of chemistry.", image: "Chemistry_Image"),
    CourseModel(id: UUID(), title: "Biology", description: "Discover the science of living organisms.", image: "Biology_Image")
]
