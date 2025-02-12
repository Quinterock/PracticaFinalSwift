//
//  LoginController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation

class LoginController {
    static func login(emailInput: String, passwordInput: String, users: [User], onSuccess: @escaping (String) -> Void, onFailure: @escaping (Error) -> Void) {
        
        // Validar email
        if let emailError = UserError.validateEmail(emailInput) {
            onFailure(emailError)
            return
        }
        
        // Verificar si el email existe en los usuarios
        guard let user = users.first(where: { $0.email == emailInput }) else {
            onFailure(UserError.emailNotFound)
            return
        }
        

        // Validar contraseña
        if let passwordError = UserError.validatePassword(passwordInput) {
            onFailure(passwordError)
            return
        }
        
        // Verificar si la contraseña coincide
        if user.checkPassword(passwordInput) {
            onSuccess(user.role.rawValue) // Pasamos el rawValue aquí, ya que es un String
        } else {
            onFailure(UserError.passwordDoesNotMatchEmail)
        }
    }
}




