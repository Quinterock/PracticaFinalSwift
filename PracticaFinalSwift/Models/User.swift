//
//  User.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//
import Foundation

// MARK: - Definir los roles de usuario
// Enum para los posibles roles de usuario (administrador o usuario normal)
enum UserRole: String {
    case admin = "Administrador" // Rol de administrador
    case normal = "Usuario normal" // Rol de usuario normal
}

// MARK: - Definir errores de usuario
// Enum que representa los posibles errores al manejar la autenticación de usuarios
enum UserError: Error {
    case emailNotFound
    case passwordDoesNotMatchEmail
    case invalidEmail // Error cuando el email tiene un formato inválido
    case invalidPassword // Error cuando la contraseña tiene formato inválido
    case emptyInput
    
    // Descripción legible para los errores
    var localizedDescription: String {
        switch self {
        case .emailNotFound:
            return "El email no fue encontrado"
        case .passwordDoesNotMatchEmail:
            return "La contraseña es incorrecta"
        case .invalidEmail:
            return "Email con formato erroneo, verifique que contenga @ y termine con un .com o .es"
        case .invalidPassword:
            return "La contraseña debe tener mínimo 8 caracteres entre ellos una mayuscula y un número"
        case .emptyInput:
            return "El campo no puede estar vacío"
        }
    }
    
    // Verifica que el email no esté vacío y tenga el formato correcto
    static func validateEmail(_ email: String) -> UserError? {
        let pattern = "^[A-Za-z0-9]+@[A-Za-z0-9]+\\.(com|es)$" // Expresión regular para el formato del email
        return email.range(of: pattern, options: .regularExpression) == nil ? .invalidEmail : nil
    }
    
    // Verifica que la contraseña tenga el formato correcto
    static func validatePassword(_ password: String) -> UserError? {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[A-Z]).{8,}$" // Expresión regular para validar la contraseña
        return password.range(of: pattern, options: .regularExpression) == nil ? .invalidPassword : nil
    }
}

// MARK: - Definir el modelo de usuario
// Estructura que representa un usuario con sus propiedades y métodos asociados
struct User {
    let username: String
    let email: String
    private let password: String
    let role: UserRole 
    
    // Inicializador que valida el email y la contraseña antes de crear el objeto
    init(username: String, email: String, password: String, role: UserRole) throws {
        // Validar email y contraseña con sus respectivas funciones de validación
        if let emailError = UserError.validateEmail(email) {
            throw emailError // Lanzar error si el email no es válido
        }
        if let passwordError = UserError.validatePassword(password) {
            throw passwordError // Lanzar error si la contraseña no es válida
        }
        
        self.username = username
        self.email = email
        self.password = password
        self.role = role
    }
    
    // Función que retorna el rol del usuario como texto
    func getRole() -> String {
        return role.rawValue // Retorna el valor del rol (admin o normal)
    }
    
    // Función que verifica si la contraseña ingresada es correcta
    func checkPassword(_ inputPassword: String) -> Bool {
        return password == inputPassword // Compara la contraseña ingresada con la almacenada
    }
}

