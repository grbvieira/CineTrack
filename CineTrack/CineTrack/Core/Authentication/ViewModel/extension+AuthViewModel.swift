//
//  extension+AuthViewModel.swift
//  CineTrack
//
//  Created by Gerson Vieira on 01/12/24.
//

import Foundation
import FirebaseAuth

extension AuthViewModel {
    func errorSignInError(error: Error) {
        var messageError = String()
        print("DEBUG: error \(error.localizedDescription)")
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            switch errorCode {
            case .emailAlreadyInUse:
                messageError = "Email já está vinculado a uma conta"
            case .invalidEmail:
                messageError = "Email inválido"
            case .wrongPassword:
                messageError = "Senha inválida"
            case .tooManyRequests:
                messageError = "Erro: Você fez muitas tentativas"
            case .userNotFound:
                messageError = "Usuário não encontrado"
            case .networkError:
                messageError = "Erro de comunicação, verifique sua internet"
            case .userDisabled:
                messageError = "Usuario desativado"
            case . invalidCredential:
               messageError = "Credencial inválida"
            default:
                messageError = "Erro desconhecido"
            }
        }
        
        self.isAlertPresent = true
        self.alertMessage = messageError
    }
}
