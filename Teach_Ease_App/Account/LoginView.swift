//
//  LoginView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var userLogin = UserLogin(email: "", password: "")
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false // Tracks login state

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("TeachEase")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 50)
                    .padding(.bottom, 100)

                TextField("Enter your email", text: $userLogin.email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Enter your password", text: $userLogin.password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                Button(action: handleLogin) {
                    Text("Log in")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)

                Spacer()
                
                // Navigation Link to HomePageView when logged in
                NavigationLink(
                    destination: HomePageView(),
                    isActive: $isLoggedIn
                ) {
                    EmptyView()
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func handleLogin() {
        guard userLogin.isValidEmail(), userLogin.isPasswordValid() else {
            alertMessage = "Invalid email or password"
            showAlert = true
            return
        }
        
        Auth.auth().signIn(withEmail: userLogin.email, password: userLogin.password) { _, error in
            if let error = error {
                alertMessage = "Login error: \(error.localizedDescription)"
                showAlert = true
            } else {
                alertMessage = "Login successful!"
                showAlert = true
                isLoggedIn = true // Set login state to true
            }
        }
    }
}

#Preview {
    LoginView()
}
