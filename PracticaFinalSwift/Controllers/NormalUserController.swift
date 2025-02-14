//
//  NormalUserController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 11/02/25.
//

import Foundation


class NormalUserController {
    // MARK: -1 Ver todas las rutas
    
    static func showAllRoutes() {
        Route.showAllRoutes()
    }
    
    // MARK: -2 Obtener la ruta más corta entre dos puntos
    static func showShortestRouteNotImplementedYet() {
        print("Esta característica no está implementada todavía, disculpe las molestias")
    }
    
    // MARK: -3 Log out
    static func logOut() {
        print("Cerrando sesión, Hasta luego!")
        print()
        MenuController().mainMenu()
    }
}
