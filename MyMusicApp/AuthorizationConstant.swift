//
//  AuthorizationConstant.swift
//  MyMusicApp
//
//  Created by Edward on 12.06.2023.
//

import UIKit


enum AuthConstant {
    
    enum Image {
        static let singInBackground = UIImage(named: "singInBackground")
        static let singUpBackground = UIImage(named: "singUpBackground")
    }
    
    enum Text {
        //Title
        static let singIn = "SIGN IN"
        static let singUp = "SIGN UP"
        static let forgotPasswordTitle = "Forgot Password?"
        static let changePasswordTitle = "Change Password?"


        //Label
        static let email = "E-Mail"
        static let password = "Password"
        static let name = "Name"
        static let confirmPassword = "Confirm password"
        static let connectWith = "Or connect with"
        static let haveAccount = "Don't have an account?"
        
        //Text
        static let resetPasswordText = "If you need help resetting your password,\nwe can help by sending you a link to\nreset it."
        static let changePasswordText = """
        Please enter your new password and confirm it in the second field.
        Your password should be at least 8 characters long
        and contain a mix of letters, numbers, and special characters.
        """

        //Button
        static let singUpHaveAccountButton = "Sign up"
        static let sentButton = "SENT"
        static let changePasswordButton = "CHANGE PASSWORD"

    }
    
    enum Symbol {
//        static let seePassword = UIImage(systemName: "eye")
        static let seePassword = UIImage(named: "eye")
        static let lock = UIImage(systemName: "lock.fill")
        static let email = UIImage(systemName: "at")
        static let name = UIImage(systemName: "person.crop.circle")
        static let google = UIImage(named: "Google")
    }
}

