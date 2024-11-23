//
//  ProfileCreationView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-11-06.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct ProfileCreationView: View {
    @State private var username: String = ""
    @State private var dob: Date = Date()
    @State private var education: String = ""
    @State private var language: String = ""
    @State private var bio: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isProfileSaved: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Create Your Profile")
                .font(.largeTitle)
                .bold()
                .padding(.top, 60)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.top, 40)
            
            HStack {
                Text("Date of Birth")
                    .foregroundColor(.gray)
                Spacer()
                DatePicker("", selection: $dob, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            
            TextField("Education", text: $education)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            TextField("Language", text: $language)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            TextField("Bio", text: $bio, axis: .vertical)
                .padding()
                .frame(height: 100)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            Button(action: saveProfile) {
                Text("Save Profile")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 60)
            
            Spacer()
        
            NavigationLink(destination: HomePageView(), isActive: $isProfileSaved) {
                EmptyView()
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Profile Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func saveProfile() {
        guard let userId = Auth.auth().currentUser?.uid else {
            alertMessage = "User not found."
            showAlert = true
            return
        }
        
        let profileData: [String: Any] = [
            "username": username,
            "dob": dob,
            "education": education,
            "language": language,
            "bio": bio
        ]
        
        Firestore.firestore().collection("users").document(userId).setData(profileData) { error in
            if let error = error {
                alertMessage = "Error saving profile: \(error.localizedDescription)"
                showAlert = true
            } else {
                alertMessage = "Profile saved successfully!"
                showAlert = true
                isProfileSaved = true // Navigate to HomePageView
            }
        }
    }
}



#Preview {
    ProfileCreationView()
}
