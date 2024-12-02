//
//  HomeContentView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI

// MARK: - HomeContentView
struct HomeContentView: View {
    var body: some View {
        NavigationView { 
            VStack(spacing: 0) {
                HStack {
                    Text("TeachEase")
                        .font(.largeTitle)
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
                .background(Color.white)
                
                Divider()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        FeaturedCourseView(course: featuredCourse)
                            .padding(.horizontal, 20)

                        Text("Programming Categories")
                            .font(.headline)
                            .padding(.horizontal, 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(sampleCourses) { course in
                                    NavigationLink(destination: CourseDetailView(course: course)) {
                                        CourseCard(course: course)
                                            .frame(width: 220)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .padding(.top, 10)
                        
                        Text("Science Categories")
                            .font(.headline)
                            .padding(.horizontal, 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(sampleScienceCourses) { course in
                                    NavigationLink(destination: CourseDetailView(course: course)) {
                                        CourseCard(course: course)
                                            .frame(width: 220)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .padding(.top, 10)
                    }
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .ignoresSafeArea(edges: .top)
        }
    }
}

// MARK: - FeaturedCourseView
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

// MARK: - CourseCard
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
        .frame(width: 220, height: 300)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// MARK: - CourseDetailView
struct CourseDetailView: View {
    let course: CourseModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(course.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)
                
                Text(course.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, -50)
                
                Text(course.description)
                    .font(.headline)
                    .padding([.horizontal, .top])
                    .padding(.top, -30)
                
                Text(course.details)
                    .font(.body)
                    .padding([.horizontal, .bottom])
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(course.title)
    }
}


#Preview {
    HomeContentView()
}
