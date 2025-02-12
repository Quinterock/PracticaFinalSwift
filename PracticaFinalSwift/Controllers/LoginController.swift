//
//  LoginController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation

// MARK: - Controlador de Login
// Clase encargada de gestionar el proceso de login para los usuarios
class LoginController {
    
    // Recibe el email y la contraseña del usuario, verifica si son correctos y maneja los resultados
    static func login(emailInput: String, passwordInput: String, users: [User], onSuccess: @escaping (String, String) -> Void, onFailure: @escaping (Error) -> Void) {
        
        // Validar el formato del email
        if let emailError = UserError.validateEmail(emailInput) {
            onFailure(emailError) // Llamar a la función de error si el email no es válido
            return
        }
        
        // Verificar si el email existe en la lista de usuarios
        guard let user = users.first(where: { $0.email == emailInput }) else {
            onFailure(UserError.emailNotFound) // Llamar a la función de error si el email no se encuentra
            return
        }
        
        // Validar el formato de la contraseña
        if let passwordError = UserError.validatePassword(passwordInput) {
            onFailure(passwordError) // Llamar a la función de error si la contraseña no es válida
            return
        }
        
        // Verificar si la contraseña coincide con la registrada
        if user.checkPassword(passwordInput) {
            onSuccess(user.role.rawValue, user.username) // Pasamos el rawValue para el rol como un String
        } else {
            onFailure(UserError.passwordDoesNotMatchEmail)
        }
    }
}





