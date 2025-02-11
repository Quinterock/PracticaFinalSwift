//
//  UserFunctions.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation

// MARK: - Clase para manejar el login de usuario y sólo llamar esta función en main
class UserLoginHandler {
    
    // Función para manejar el login de un usuario
    static func handleUserLogin(users: [User]) {
        print("Ingrese su email:")
        
        // Validar que el email no esté vacío
        guard let emailInput = readLine(), !emailInput.isEmpty else {
            print(UserError.emptyInput.localizedDescription) // Error si el email está vacío
            return
        }
        
        // Verificar si el email existe en la lista de usuarios
        guard users.contains(where: { $0.email == emailInput }) else {
            print(UserError.emailNotFound.localizedDescription) // Error si el email no está registrado
            return
        }
        
        // Validar formato del email ingresado
        if let error = UserError.validateEmail(emailInput) {
            print("Error: \(error)") // Error si el email no es válido
            return
        }
        
        print("Ingrese su contraseña:")
        
        // Validar que la contraseña no esté vacía
        guard let passwordInput = readLine(), !passwordInput.isEmpty else {
            print(UserError.emptyInput.localizedDescription) // Error si la contraseña está vacía
            return
        }
        
        // Verificar que la contraseña coincida con el email
        guard users.contains(where: { $0.checkPassword(passwordInput) }) else {
            print(UserError.passwordDoesNotMatchEmail.localizedDescription) // Error si la contraseña no coincide
            return
        }
        
        // Validar la contraseña según las reglas definidas
        if let error = UserError.validatePassword(passwordInput) {
            print(error.localizedDescription) // Error si la contraseña no es válida
            return
        }
        
        // MARK: - Llamada al controlador de Login
        LoginController.login(emailInput: emailInput, passwordInput: passwordInput, users: users, onSuccess: { role in
            print("Login exitoso como \(role)") // Muestra el rol si el login es exitoso
        }, onFailure: { error in
            print("Error: \(error.localizedDescription)") // Muestra el error si el login falla
        })
    }
}

