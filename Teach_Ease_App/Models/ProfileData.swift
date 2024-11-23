//
//  ProfileData.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-11-07.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

class ProfileData: ObservableObject {
    @Published var username: String = ""
    @Published var dob: Date = Date()
    @Published var education: String = ""
    @Published var language: String = ""
    @Published var bio: String = ""

    func loadProfile() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        Firestore.firestore().collection("users").document(userId).getDocument { document, error in
            if let document = document, document.exists {
                self.username = document.get("username") as? String ?? ""
                self.dob = (document.get("dob") as? Timestamp)?.dateValue() ?? Date()
                self.education = document.get("education") as? String ?? ""
                self.language = document.get("language") as? String ?? ""
                self.bio = document.get("bio") as? String ?? ""
            }
        }
    }
}
