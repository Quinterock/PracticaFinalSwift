//
//  UserController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation
// MARK: Función de muestreo de Menú de Usuario Normal
class UserMenu {
    static func showMenu() {
        //Variable para mantener en ejecución
        var isActiveMenu = true
        while isActiveMenu {
            print("-------------------------")
            print("Menú usuario - Selecciona una opción:")
            print("1. Ver todas las rutas")
            print("2. Obtener la ruta más corta entre dos puntos")
            print("3. Log out")
            
            if let choice = readLine() {
                switch choice {
                case "1":
                    NormalUserController.showAllRoutes()
                case "2":
                    NormalUserController.showShortestRouteNotImplementedYet()
                case "3":
                    NormalUserController.logOut()
                    isActiveMenu = false
            default:
                print("Opción no válida")
                }
            }
        }
    }
}
