//
//  AdminController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation
import os

//El menú de administrador debe mostrar las siguientes opciones:
//Menú admin - Selecciona una opción:
//1. Ver todos los usuarios
//2. Añadir usuario
//3. Eliminar usuario
//4. Añadir punto a una ruta
//5. Logout

let adminLogger = Logger(subsystem: "com.luisquintero.app", category: "admin_menu")
// MARK: Menú de usuario administrador
class AdminMenu {
    // MARK: Función de muestreo de Menú de Administrador
    static func showMenu() {
        let main = MenuController()
        //Variable para mantener en ejecución
        var shouldExit = true
        
        while shouldExit{
            print("-------------------------")
            print("Menú admin - Selecciona una opción:")
            print("1. Ver todos los usuarios")
            print("2. Añadir usuario")
            print("3. Eliminar usuario")
            print("4. Añadir punto a una ruta")
            print("5. Logout")
            
            if let choice = readLine(){
                switch choice {
                    case "1":
                    adminLogger.info("Mostrar todos los usuarios")
                    AdminController.showAllUsers(users: main.users)
                    case "2":
                    adminLogger.info("Añadir usuario")
                    AdminController.addUser(users: &main.users)
                    case "3":
                    adminLogger.info("Eliminar usuario")
                    AdminController.deleteUser(users: &main.users)
                    case "4":
                    adminLogger.info("No implementado")
                    AdminController.addRouteNotImplementedYet()
                    case "5":
                    adminLogger.info("Saliendo de admin")
                    AdminController.logout()
                    shouldExit = false
                    default:
                    print("Opción no válida")
                }
            }
        }
    }
}
