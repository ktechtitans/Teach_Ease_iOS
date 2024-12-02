//
//  CourseModel.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import Foundation

struct CourseModel: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let image: String
    let details: String
}

let featuredCourse = CourseModel(
    id: UUID(),
    title: "Swift Programming",
    description: "Master iOS development with Swift.",
    image: "Swift_Language",
    details: ""
)

let sampleCourses: [CourseModel] = [
    CourseModel(id: UUID(), title: "C Programming", description: "Learn the basics of C programming.", image: "C_Language", details: "Introduction - C programming is a structured and procedural programming language developed by Dennis Ritchie in 1972 at Bell Labs. It is widely used for system-level programming, including operating systems, embedded systems, and hardware drivers, due to its efficiency and close-to-hardware functionality. C programs are known for their ability to execute quickly, making them ideal for performance-critical applications. A typical C program consists of functions, with `main()` being the entry point. Features such as loops, conditionals, arrays, pointers, and file handling provide the flexibility to write versatile and complex programs. Libraries in C, such as `<stdio.h>` and `<stdlib.h>`, offer functions for tasks like input/output, memory management, and mathematical operations. C's syntax, including keywords, data types, and operators, lays the foundation for several other programming languages like C++, Java, and Python. The language promotes modular programming through functions, allowing code reusability and easier debugging. With its support for dynamic memory allocation using `malloc()` and `free()`, C enables efficient memory management. Overall, C remains a foundational language in computer science and engineering education, as well as in professional software development."),
    CourseModel(id: UUID(), title: "C++ Programming", description: "Explore object-oriented programming with C++.", image: "C++_Language", details: "C++ is a powerful, versatile programming language that builds upon the foundations of C by introducing object-oriented programming (OOP) features. Created by Bjarne Stroustrup in the early 1980s, C++ supports both procedural and OOP paradigms, making it suitable for a wide range of applications, from low-level system programming to high-level application development. One of the key features of C++ is its support for classes and objects, enabling developers to model real-world entities. Encapsulation allows data hiding, where class attributes are made private and accessible only through public methods, ensuring security and controlled access. Inheritance and polymorphism simplify the reuse and extension of code, allowing developers to create complex and flexible systems. For example, a base class like `Animal` can be extended into derived classes like `Dog` or `Cat`, each having specialized behaviors while sharing common properties. C++ also includes features like function and operator overloading, templates, and the Standard Template Library (STL), which provide pre-defined data structures (like vectors, maps, and lists) and algorithms for efficient programming. Memory management is another strength, as C++ provides manual memory allocation (`new` and `delete`) and advanced techniques like smart pointers for dynamic resource handling. Due to its balance of high-level abstraction and low-level control, C++ remains a staple in game development, graphics programming, and embedded systems, as well as in teaching programming concepts. Its legacy as an evolution of C makes it one of the most enduring and widely-used programming languages in the world."),
    CourseModel(id: UUID(), title: "R Programming", description: "Data analysis and visualization with R.", image: "R_Language", details: "R is a programming language and software environment primarily used for statistical computing, data analysis, and graphical representation. Developed by Ross Ihaka and Robert Gentleman in the early 1990s, R has become a cornerstone for data scientists, statisticians, and researchers across various domains. It is an open-source implementation of the S language, which was developed at Bell Labs. R is particularly popular for its extensive library ecosystem, including CRAN (Comprehensive R Archive Network), which provides thousands of packages tailored for diverse analytical tasks. These packages enable users to perform data manipulation, statistical modeling, machine learning, and visualization with ease. Tools like `dplyr` and `tidyr` streamline data cleaning and transformation, while `ggplot2` and `lattice` provide powerful visualization capabilities. One of the key strengths of R is its ability to handle and analyze large datasets efficiently. It supports a wide range of data formats, including CSV, Excel, JSON, SQL databases, and even big data frameworks. With built-in statistical functions and support for custom modeling, R is ideal for tasks like hypothesis testing, regression analysis, and predictive modeling. R also has an interactive environment for data exploration, making it easy for users to iteratively refine their analyses. Its integration with other programming languages like Python, C++, and Java expands its utility in complex workflows. Additionally, tools like R Markdown and Shiny enable the creation of dynamic reports and interactive dashboards, facilitating effective communication of insights. As a versatile tool, R is widely used in industries such as finance, healthcare, marketing, and academia, where data-driven decisions are crucial. Its vibrant community contributes to its ongoing development, ensuring that it remains at the forefront of statistical computing and data analysis.")
]

let sampleScienceCourses: [CourseModel] = [
    CourseModel(id: UUID(), title: "Physics", description: "Learn the fundamentals of physics.", image: "Physics_Image", details: "Explore the basic principles of physics, including mechanics, energy, and thermodynamics. This course covers essential concepts that lay the foundation for more advanced studies in physical sciences."),
    CourseModel(id: UUID(), title: "Chemistry", description: "Explore the world of chemistry.", image: "Chemistry_Image", details: "In this course, you'll study the fundamentals of chemistry, including atomic structure, chemical bonding, reactions, and ")
    ]
