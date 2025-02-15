//
//  UserFunctions.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation
import os

let userFunctionsLogger = Logger(subsystem: "com.luisquintero.app", category: "user_functions")

// MARK: - Clase para manejar el login de usuario y sólo llamar esta función en main
class UserLoginHandler {
    
    // Función para manejar el login de un usuario
    static func handleUserLogin(users: [User], requiredRole: UserRole) {
        print("Ingrese su email:")
        
        // Validar que el email no esté vacío
        guard let emailInput = readLine(), !emailInput.isEmpty else {
            print(UserError.emptyInput.localizedDescription) // Error si el email está vacío
            return
        }
        
        // Verificar si el email existe
        guard users.contains(where: { $0.email == emailInput }) else {
            print(UserError.emailNotFound.localizedDescription) // Error si el email no está registrado
            return
        }
        
        // Verificar si el email existe en la lista de usuarios
        guard let user = users.first(where: { $0.email == emailInput }) else {
            print(UserError.emailNotFound.localizedDescription)
            return
            }
        
        
        // Verificar si el rol coincide con el requerido
        if user.role != requiredRole {
                    let errorMessage = requiredRole == .normal ? "Debe ingresar con un usuario normal" : "Debe ingresar con un administrador"
                    print(errorMessage)
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
        LoginController.login(emailInput: emailInput, passwordInput: passwordInput, users: users, onSuccess: { role, username in
            print()
            print("Login exitoso como \(role), Buen día \(username)") // Muestra el rol y username
            
            // Si es el login es exitoso ejecuta el menú del usuario correspondiente
            if role == UserRole.admin.rawValue {
                userFunctionsLogger.info("mostrar menu si es admin o usuario normal")
                AdminMenu.showMenu()
            } else {
                userFunctionsLogger.info("mostrar menu si es admin o usuario normal")
                UserMenu.showMenu()
            }
        }, onFailure: { error in
            print("Error: \(error.localizedDescription)")
        })
    }
}

