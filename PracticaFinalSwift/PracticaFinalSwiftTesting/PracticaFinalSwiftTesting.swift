//
//  PracticaFinalSwiftTesting.swift
//  PracticaFinalSwiftTesting
//
//  Created by Luis Quintero on 13/02/25.
//

import Testing

struct PracticaFinalSwiftTesting {
    let main = MenuController()
    // Verificar que hay dos usuarios por defecto
    @Test func example() async throws {
        #expect(main.users.count == 2)
    }
    
    //Verificar que el primer usuario es administrador
    @Test func verifyAdminUser() async throws {
        let admin = MenuController()
        let hasAdminUser = admin.users.contains {$0.role == .admin}
        #expect(hasAdminUser)
    }
}
