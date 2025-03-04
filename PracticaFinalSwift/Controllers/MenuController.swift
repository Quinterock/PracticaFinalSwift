//
//  MenuController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 13/02/25.
//

import Foundation
import os

let menuControllerLogger = Logger(subsystem: "com.luisquintero.app", category: "controller_menu")
// MARK: Menú Inicial
class MenuController {
    // MARK: - Cargar usuarios predeterminados
    // Por defecto, deben existir un usuario regular y otro administrador cargados en el programa desde el inicio:
    var users: [User] = [
        try! User(username: "Adminuserkeepcoding1", email: "adminuser@keepcoding.es", password: "Adminuser1", role: .admin), // Usuario administrador
        try! User(username: "Regularuserkeepcoding", email: "regularuser@keepcoding.es", password: "Regularuser1", role: .normal) // Usuario regular
    ]

    // MARK: - Menú principal
    func mainMenu() {
        var shouldExit = true
        
        while shouldExit {
            print("Bienvenido a SnowTrials")
            print("1. Acceder como Usuario Normal")
            print("2. Acceder como Administrador")
            print("3. Salir")
            
        // Leer la opción seleccionada por el usuario
            if let choice = readLine() {
                
                switch choice {
                case "1":
                    menuControllerLogger.info("Login de usuario normal")
                    // Llamar al handler de login para el usuario normal
                    UserLoginHandler.handleUserLogin(users: users, requiredRole: .normal)
                case "2":
                    menuControllerLogger.info("Login de administrador")
                    // Llamar al handler de login para el administrador
                    UserLoginHandler.handleUserLogin(users: users, requiredRole: .admin)
                case "3":
                    menuControllerLogger.info("Cerrando programa")
                    print("Gracias por usar el programa. ¡Adiós!")
                    shouldExit = false
                default:
                    print("Opción inválida. Intente nuevamente.")
                }
            }
        }
        
        
    }
}
