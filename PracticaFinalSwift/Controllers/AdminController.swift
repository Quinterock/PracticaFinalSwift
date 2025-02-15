//
//  AdminController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 11/02/25.
//
// MARK: Funciones para el menú de admin
class AdminController {
    
    // MARK: - 1 Mostrar todos los usuarios
    static func showAllUsers(users: [User]) {
        print("Lista de usuarios:")
        users.forEach { user in
            print("\(user.role.rawValue): \(user.username) --- Email: \(user.email)")
        }
    }

    // MARK: - 2 Crear usuarios (Versión para TESTING)
    static func addUser(users: inout [User], username: String, email: String, password: String) -> String {
        // Validar que el email no esté repetido
        guard !users.contains(where: { $0.email == email }) else {
            return "Error: El email ya existe en la lista de usuarios."
        }

        // Validar email
        if let emailError = UserError.validateEmail(email) {
            return "Error: \(emailError.localizedDescription)"
        }

        // Validar contraseña
        if let passwordError = UserError.validatePassword(password) {
            return "Error: \(passwordError.localizedDescription)"
        }

        // Intentar crear usuario
        do {
            let newUser = try User(username: username, email: email, password: password, role: .normal)
            users.append(newUser)
            return "Usuario \(newUser.username) añadido correctamente."
        } catch {
            return "Error al crear usuario: \(error.localizedDescription)"
        }
    }

    #if DEBUG
    // MARK: - 2 Crear usuarios (Versión para PRODUCCIÓN)
    static func addUser(users: inout [User]) {
        print("\nAñadir usuario")

        print("Introduce el nombre del usuario:")
        guard let username = readLine(), !username.isEmpty else {
            print(UserError.emptyInput.localizedDescription)
            return
        }

        print("Introduce el email del usuario:")
        guard let email = readLine(), !email.isEmpty else {
            print(UserError.emptyInput.localizedDescription)
            return
        }

        print("Introduce la contraseña:")
        guard let password = readLine(), !password.isEmpty else {
            print(UserError.emptyInput.localizedDescription)
            return
        }

        // Llama a la versión con parámetros
        let result = addUser(users: &users, username: username, email: email, password: password)
        print(result)
    }
    #endif

    // MARK: - 3 Eliminar usuarios
    static func deleteUser(users: inout [User]) {
        print("Introduce el nombre del usuario que quieres eliminar:")
        guard let userToDelete = readLine(), !userToDelete.isEmpty else {
            print(UserError.emptyInput.localizedDescription)
            return
        }

        let initialCount = users.count
        users.removeAll { $0.username == userToDelete }

        let deletedCount = initialCount - users.count
        print(deletedCount > 0 ? "Se eliminó \(deletedCount) usuario(s)." : "Usuario no encontrado.")
    }

    // MARK: - 4 Añadir punto a una ruta (No implementado)
    static func addRouteNotImplementedYet() {
        print("Esta característica no está implementada todavía, disculpe las molestias")
    }

    // MARK: - 5 Logout
    static func logout() {
        print("Cerrando sesión, Hasta luego!")
        MenuController().mainMenu()
    }
}
