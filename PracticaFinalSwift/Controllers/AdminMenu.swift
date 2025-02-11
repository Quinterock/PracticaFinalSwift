//
//  AdminController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation

//El menú de administrador debe mostrar las siguientes opciones:
//Menú admin - Selecciona una opción:
//1. Ver todos los usuarios
//2. Añadir usuario
//3. Eliminar usuario
//4. Añadir punto a una ruta
//5. Logout

class AdminMenu {
    static func showMenu() {
        //Se repite hasta que se ponga 5
        var shouldExit = true
        
        while shouldExit{
            
            print()
            print("-------------------------")
            print()
            print("Menú admin - Selecciona una opción:")
            print("1. Ver todos los usuarios")
            print("2. Añadir usuario")
            print("3. Eliminar usuario")
            print("4. Añadir punto a una ruta")
            print("5. Logout")
            
            if let choice = readLine(){
                switch choice {
                    case "1":
                    AdminController.showAllUsers(users: users)
                    case "2":
                    AdminController.addUser(users: &users)
                    case "3":
                    AdminController.deleteUser(users: &users)
                    case "4":
                    AdminController.addRouteNotImplementedYet()
                    case "5":
                    AdminController.logout()
                    shouldExit = false
                    default:
                    print("Default")
                }
            }
        }
    }
}
