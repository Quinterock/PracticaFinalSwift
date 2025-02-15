//
//  NormalUserController.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 11/02/25.
//

import Foundation
import os

let normalUserControllerLogger = Logger(subsystem: "com.luisquintero.app", category: "normal_user_controller_menu")

// MARK: Menú de usuario normal
class NormalUserController {
    // MARK: -1 Ver todas las rutas
    
    static func showAllRoutes() {
        normalUserControllerLogger.info("Mostrando todas las rutas")
        Route.showAllRoutes()
    }
    
    // MARK: -2 Obtener la ruta más corta entre dos puntos
    static func showShortestRouteNotImplementedYet() {
        normalUserControllerLogger.info("No implementado")
        print("Esta característica no está implementada todavía, disculpe las molestias")
    }
    
    // MARK: -3 Log out
    static func logOut() {
        normalUserControllerLogger.info("Cerrando sesión")
        print("Cerrando sesión, Hasta luego!")
        print()
        MenuController().mainMenu()
    }
}
