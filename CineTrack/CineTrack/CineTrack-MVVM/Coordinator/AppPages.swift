//
//  AppPages.swift
//  CineTrack
//
//  Created by Gerson Vieira on 28/11/24.
//

import Foundation
import UIKit

enum AppPages {
   // case main
    case signIn
    case profile
    case signUp
}

/*enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
}*/

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case signup
    
}
