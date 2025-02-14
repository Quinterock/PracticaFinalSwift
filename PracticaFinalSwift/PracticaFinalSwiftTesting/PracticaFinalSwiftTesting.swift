//
//  PracticaFinalSwiftTesting.swift
//  PracticaFinalSwiftTesting
//
//  Created by Luis Quintero on 13/02/25.
//

import Testing

struct PracticaFinalSwiftTesting {
    
    // MARK: Tests de Menu Controller
    @Suite struct MenuControllerTest {
        let main = MenuController()
        // Verificar que hay dos usuarios por defecto
        @Test func example() async throws {
            #expect(main.users.count == 2)
        }
        
        //Verificar que hay un usuario adminitrador por defecto
        @Test func verifyAdminUser() async throws {
            let admin = MenuController()
            let hasAdminUser = admin.users.contains {$0.role == .admin}
            #expect(hasAdminUser)
        }
        
        //Verificar que hay un usuario normal por defecto
        @Test func verifyNormalUser() async throws {
            let normalUser = MenuController()
            let hasNormalUser = normalUser.users.contains(where: { $0.role == .normal })
            #expect(hasNormalUser)
        }

        //Email inválido
        @Test func testInvalidEmailFormat() async throws {
            do {
                _ = try User(username: "test", email: "ek.es", password: "Password1", role: .normal)
                #expect (Bool(false)) // No debería llegar aquí
            } catch {
                #expect(true) // Se debe lanzar un error
            }
        }
        
        //Email vacío
        @Test func emptyEmailFormat() async throws {
            do {
                _ = try User(username: "test", email: "", password: "Password1", role: .normal)
                #expect (Bool(false)) // No debería llegar aquí
            } catch {
                #expect(true) // Se debe lanzar un error
            }
        }
        
        //Contraseña vacía
        @Test func emptyPasswordFormat() async throws {
            do {
                _ = try User(username: "Alex", email: "a@a.es", password: "", role: .normal)
                #expect(Bool(false))
            } catch {
                #expect(true)
            }
        }
    }
    
    @Suite struct AdminMenuTest {
        
        
        
    }
    
}
