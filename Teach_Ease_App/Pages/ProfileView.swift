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
    @State private var languagePreference: String = ""
    @State private var bio: String = ""
    @State private var isLoading: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            if isLoading {
                ProgressView("Loading Profile...")
            } else {
                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Username: \(username)")
                    Text("Date of Birth: \(formattedDate(dob))")
                    Text("Education: \(education)")
                    Text("Language Preference: \(languagePreference)")
                    Text("Bio: \(bio)")
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            }
        }
        .padding()
        .onAppear(perform: fetchProfileData)
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
                self.languagePreference = document.get("languagePreference") as? String ?? ""
                self.bio = document.get("bio") as? String ?? ""
            }
            self.isLoading = false
        }
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    ProfileView()
}
