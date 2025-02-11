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
            // Solicitar email y contraseña
            print("Ingrese su email:")
            guard let emailInput = readLine(), !emailInput.isEmpty else {
                print(UserError.emptyInput.localizedDescription)
                return
            }
            
            //Validar que exista email
            guard users.contains(where: {$0.email == emailInput}) else {
                print(UserError.emailNotFound.localizedDescription)
                return
            }
            
            // Validar email
            if let error = UserError.validateEmail(emailInput) {
//                print(error.localizedDescription)
                print("Error: \(error)")
                return
            }
            
            print("Ingrese su contraseña:")
            guard let passwordInput = readLine(), !passwordInput.isEmpty else {
                print(UserError.emptyInput.localizedDescription)
                return
            }
            
            //Verificar que la contraseña sea la correcta para el email ingresado
            guard users.contains(where: {$0.checkPassword(passwordInput)}) else {
                print(UserError.passwordDoesNotMatchEmail.localizedDescription)
                return
            }
            
            
            // Validar contraseña
            if let error = UserError.validatePassword(passwordInput) {
                print(error.localizedDescription)
                return
            }
            
            // Llamar a la función Login para checar email y password
            LoginController.login(emailInput: emailInput, passwordInput: passwordInput, users: users, onSuccess: {role in
                print("Login exitoso como \(role)")
            }, onFailure: {error in
                print("Error: \(error.localizedDescription)")
            })
            
        default:
            print("Opción inválida. Intente nuevamente.")
        }
    }
}

mainMenu()


