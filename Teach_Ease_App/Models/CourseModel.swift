//
//  CourseModel.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import Foundation

struct Category: Identifiable {
    var id: String
    var title: String
    var courses: [Course]
}

struct Course: Identifiable {
    var id: String
    var courseName: String
    var courseDescription: String
    var imageUrl: String
}
