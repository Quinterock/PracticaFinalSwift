//
//  AdminController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 11/02/25.
//

import Foundation

class AdminController {
    
    // MARK: -1 Mostrar todos los usuarios
    // Función para mostrar la lista completa de usuarios
    static func showAllUsers(users: [User]) {
        print("Lista de usuarios:")
        print()
        users.forEach { user in
            print("\(user.role.rawValue): \(user.username) --- Email: \(user.email)") // Imprime el rol, nombre de usuario y email
        }
    }
    
    // MARK: -2 Crear usuarios normales
    static func addUser(users: inout [User]) {
        print("\nAñadir usuario")
        
        // Solicitar y validar nombre de usuario
        print("Introduce el nombre del usuario que quieres añadir:")
        guard let username = readLine(), !username.isEmpty else {
            print(UserError.emptyInput.localizedDescription) // Mensaje de error si no se ingresa un nombre
            return
        }
        
        // Solicitar y validar email
        print("Introduce el email del usuario que quieres añadir:")
        guard let email = readLine(), !email.isEmpty else {
            print(UserError.emptyInput.localizedDescription) // Mensaje de error si no se ingresa un email
            return
        }
        
        // Verificar que el email no exista en la lista de usuarios
        guard !users.contains(where: { $0.email == email }) else {
            print("Error: El email ya existe en la lista de usuarios.") // Mensaje si el email ya está registrado
            return
        }
        
        // Validar formato del email
        if let emailError = UserError.validateEmail(email) {
            print("Error: \(emailError.localizedDescription)") // Mensaje si el formato del email es incorrecto
            return
        }
        
        // Solicitar y validar contraseña
        print("Introduce la contraseña del usuario que quieres añadir:")
        guard let password = readLine(), !password.isEmpty else {
            print(UserError.emptyInput.localizedDescription) // Mensaje de error si no se ingresa una contraseña
            return
        }
        
        // Validar formato de la contraseña
        if let passwordError = UserError.validatePassword(password) {
            print("Error: \(passwordError.localizedDescription)") // Mensaje si la contraseña no cumple los requisitos
            return
        }
        
        // Crear el nuevo usuario y manejar posibles errores
        do {
            let newUser = try User(username: username, email: email, password: password, role: .normal) // Intentar crear el nuevo usuario
            users.append(newUser) // Añadir el nuevo usuario a la lista
            print("Usuario \(newUser.username) con email \(newUser.email) añadido satisfactoriamente.")
        } catch {
            print("Error al crear usuario: \(error.localizedDescription)") // Mensaje si ocurre un error al crear el usuario
        }
    }
    
    // MARK: -3 Eliminar usuarios2
    static func deleteUser(users: inout [User]) {
        print("Introduce el nombre del usuario que quieres eliminar:")
        //Solicitar el nombre del usuario y verificar que no esté vacio
        guard let userToDelete = readLine(), !userToDelete.isEmpty else {
            print(UserError.emptyInput.localizedDescription)
            return
        }
        
        let initialCount = users.count //Guardamos la cantidad de usuarios que hay
        users.removeAll { $0.username == userToDelete }//Elimina a todos los usuarios que cumplan con una condición
        
        //Verifica si se elimina al menos un usuario, y da el mensaje correspondiente
        let deletedCount = initialCount - users.count
        if deletedCount > 0 {
            print("Se eliminaron \(deletedCount) usuario(s) con el nombre \(userToDelete)")
        } else {
            print("Usuario \(userToDelete) no encontrado")
        }
    }

    // MARK: -4 Añadir punto a una ruta
    static func addRouteNotImplementedYet() {
        print("Esta característica no está implementada todavía, disculpe las molestias")
    }
    
    // MARK: -5 Añadir Logout
    static func logout() {
        print("Cerrando sesión, Hasta luego!")
        print()
        MenuController().mainMenu()
    }
}

