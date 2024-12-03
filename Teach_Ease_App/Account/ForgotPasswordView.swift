//
//  ForgotPasswordView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-12-03.
//

import SwiftUI
import FirebaseAuth
import UserNotifications

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Reset Password")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 40)
                    .padding(.top, 80)
                
                TextField("Enter your email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Enter new password", text: $newPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                SecureField("Re-enter new password", text: $confirmPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                Button(action: resetPassword) {
                    Text("Reset Password")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)

                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .onAppear {
                requestNotificationPermission()
            }
        }
    }

    private func resetPassword() {
        guard !email.isEmpty else {
            alertMessage = "Please enter your email address."
            showAlert = true
            return
        }
        
        guard newPassword == confirmPassword else {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }

        guard newPassword.count >= 6 else {
            alertMessage = "Password must be at least 6 characters."
            showAlert = true
            return
        }

        
        Auth.auth().fetchSignInMethods(forEmail: email) { methods, error in
            if let error = error {
                alertMessage = "Error: \(error.localizedDescription)"
                showAlert = true
                return
            }

            guard methods != nil else {
                alertMessage = "No account found for this email."
                showAlert = true
                return
            }

            
            Auth.auth().currentUser?.updatePassword(to: newPassword) { error in
                if let error = error {
                    alertMessage = "Error resetting password: \(error.localizedDescription)"
                } else {
                    alertMessage = "Password reset successfully!"
                    triggerNotification(title: "Password Reset", body: "Your password was successfully reset.")
                }
                showAlert = true
            }
        }
    }

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            }
        }
    }

    private func triggerNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error showing notification: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
