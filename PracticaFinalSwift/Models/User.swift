//
//  User.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//
import Foundation

enum UserRole: String {
    case admin = "Administrador"
    case normal = "Usuario normal"
}

enum UserError: Error {
    case emailNotFound
    case passwordDoesNotMatchEmail
    case invalidEmail
    case invalidPassword
    case emptyInput
    
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
    
    // Validar email no esté vacío y cumpla con formato
    static func validateEmail(_ email: String) -> UserError? {
//        guard !email.isEmpty else {
//            return .emptyInput
//        }
        let pattern = "^[A-Za-z0-9]+@[A-Za-z0-9]+\\.(com|es)$"
        return email.range(of: pattern, options: .regularExpression) == nil ? .invalidEmail : nil
    }
    
    // Validar que contraseña no esté vacía y cumpla con formato
    static func validatePassword(_ password: String) -> UserError? {
//        guard !password.isEmpty else {
//            return .emptyInput
//        }
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[A-Z]).{8,}$"
        return password.range(of: pattern, options: .regularExpression) == nil ? .invalidPassword : nil
    }
}

struct User {
    let username: String
    let email: String
    private let password: String
    let role: UserRole
    
    init(username: String, email: String, password: String, role: UserRole) throws {
        // Validar email y contraseña no vacíos y con buen formato
        if let emailError = UserError.validateEmail(email) {
            throw emailError
        }
        if let passwordError = UserError.validatePassword(password) {
            throw passwordError
        }
        
        self.username = username
        self.email = email
        self.password = password
        self.role = role
    }
    
    func getRole() -> String {
        return role.rawValue
    }
    
    // Verificar si la contraseña es correcta
    func checkPassword(_ inputPassword: String) -> Bool {
        return password == inputPassword
    }
}
