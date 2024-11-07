//
//  CourseModel.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import Foundation

struct CourseModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String // Image name from assets
}
