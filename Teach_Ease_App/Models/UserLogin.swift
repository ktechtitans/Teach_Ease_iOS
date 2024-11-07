//
//  UserLogin.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import Foundation

struct UserLogin {
    var email: String
    var password: String

    func isValidEmail() -> Bool {
        return email.contains("@") && email.contains(".")
    }

    func isPasswordValid() -> Bool {
        return password.count >= 6
    }
}
