//
//  main.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation

// MARK: - Cargar usuarios predeterminados
// Por defecto, deben existir un usuario regular y otro administrador cargados en el programa desde el inicio:
var users: [User] = [
    try! User(username: "Adminuserkeepcoding1", email: "a@k.es", password: "Adminuser1", role: .admin), // Usuario administrador
    try! User(username: "Regularuserkeepcoding", email: "r@k.es", password: "Regularuser1", role: .normal) // Usuario regular
]

// MARK: - Menú principal
func mainMenu() {
    print("Bienvenido. Seleccione una opción:")
    print("1. Acceder como Usuario Normal")
    print("2. Acceder como Administrador")
    print("3. Salir")
    
// Leer la opción seleccionada por el usuario
    if let choice = readLine() {
        
        switch choice {
        case "1":
            // Llamar al handler de login para el usuario normal
            UserLoginHandler.handleUserLogin(users: users, requiredRole: .normal)
        case "2":
            // Llamar al handler de login para el administrador
            UserLoginHandler.handleUserLogin(users: users, requiredRole: .admin)
        case "3":
            print("Gracias por usar el programa. ¡Adiós!")
        default:
            print("Opción inválida. Intente nuevamente.")
        }
    }
}

mainMenu()


