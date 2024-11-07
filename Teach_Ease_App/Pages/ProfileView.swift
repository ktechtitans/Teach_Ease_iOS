//
//  ProfileView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-11-06.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct ProfileView: View {
    @State private var username: String = ""
    @State private var dob: Date = Date()
    @State private var education: String = ""
    @State private var language: String = ""
    @State private var bio: String = ""
    @State private var isLoading: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            if isLoading {
                ProgressView("Loading Profile...")
            } else {
                // Profile Title
                Text("Profile")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding(.top, 50)
                    .padding(.bottom, 50)

                // Profile Info Section
                VStack(alignment: .leading, spacing: 18) {
                    profileRow(label: "Username:", value: username)
                    profileRow(label: "DOB:", value: formattedDate(dob))
                    profileRow(label: "Education:", value: education)
                    profileRow(label: "Language:", value: language)
                    
                    // Bio Field with Multiline Support
                    HStack(alignment: .top) {
                        Text("BIO:")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.black.opacity(0.8))
                        Spacer()
                        Text(bio)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil) // Allows multiline text
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Divider()
                        .background(Color.gray.opacity(0.3))
                }
                .padding(.horizontal, 40)
                .padding(.top, 20)

                Spacer()
                
                // Sign Out Button
                Button(action: signOut) {
                    Text("Sign Out")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 45)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 40)
            }
        }
        .onAppear(perform: fetchProfileData)
    }

    // Function to display each row with label and value
    func profileRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.black.opacity(0.8))
            Spacer()
            Text(value)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 4)
        .overlay(
            Divider()
                .background(Color.gray.opacity(0.3)),
            alignment: .bottom
        )
    }

    func fetchProfileData() {
        guard let userId = Auth.auth().currentUser?.uid else {
            isLoading = false
            return
        }

        Firestore.firestore().collection("users").document(userId).getDocument { document, error in
            if let document = document, document.exists {
                self.username = document.get("username") as? String ?? ""
                self.dob = (document.get("dob") as? Timestamp)?.dateValue() ?? Date()
                self.education = document.get("education") as? String ?? ""
                self.language = document.get("language") as? String ?? ""
                self.bio = document.get("bio") as? String ?? ""
            }
            self.isLoading = false
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMMM-yyyy" // Match the date format in the design
        return formatter.string(from: date)
    }
    
    func signOut() {
        // Implement sign-out functionality here
    }
}

#Preview {
    ProfileView()
}

