//
//  LocalizedString.swift
//  CineTrack
//
//  Created by Gerson Vieira on 01/12/24.
//

import Foundation

struct LocalizedStringApp {
    
    enum images: String {
        case appIcon = "appIcon"
        case arrowRight = "arrow.right"
    }
    
    enum textFielTitle: String {
        case emailAddress = "Email Address"
        case password = "Password"
        case fullName = "Full name"
        case confirmPassword = "Confirm password"
    }
    
    enum placeholder: String {
        case emailExample = "name@example.com"
        case enterPassword = "Enter your password"
        case fullName = "enter your name"
        case enterName = "Enter your name"
        case confirmPassword = "Confirm your password"
    }
    
    enum buttonTitle: String {
        case signIn = "Sign In"
        case signUp = "Sign Up"
        case loginFirstLabel = "Don't have an account?"
        case haveAnAccount = "Alredy have a account?"
    }
}
