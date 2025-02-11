//
//  main.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation
//Por defecto, deben existir un usuario regular y otro administrador cargados en el programa
//desde el inicio:

let users: [User] = [
    try! User(username: "Adminuserkeepcoding1", email: "adminuser@keepcoding.es", password: "Adminuser1", role: .admin),
    try! User(username: "Regularuserkeepcoding", email: "regularuser@keepcoding.es", password: "Regularuser1", role: .normal)
]


func mainMenu() {
    print("Bienvenido. Seleccione una opción:")
    print("1. Acceder como Usuario Normal")
    print("2. Acceder como Administrador")
    print("3. Salir")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            UserLoginHandler.handleUserLogin(users: users)
        case "2":
            UserLoginHandler.handleUserLogin(users: users)
        default:
            print("Opción inválida. Intente nuevamente.")
        }
    }
}

mainMenu()


