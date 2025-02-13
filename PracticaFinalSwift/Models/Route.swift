//
//  Route.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//

import Foundation

struct Route {
    typealias Point = (lat: Double, long: Double)
    static let rutas: [String: [Point]] = [
        "Ruta del Pico Nevado y Lago Helado": [
            (46, 7.5), (46.1,7.6), (46.2,7.7)
        ],
        "Ruta del Valle Blanco y Refugio Alpino": [
            (46, 7.5), (45.9,7.4), (46.05,7.45)
        ],
        "Ruta de Cumbre Azul y Cerro Plateado": [
            (46, 7.5), (46.05, 7.55), (46.15,7.65)
        ],
        "Ruta del Bosque Nevado y Cascada Blanca": [
            (46.2, 7.7), (46.3, 7.8), (46.25,7.75)
        ],
        "Ruta completa de Alpina Grande a Cascade Blanca": [
            (46.0, 7.5), (46.1,7.6), (46.2,7.7), (46.25,7.75)
        ],
        "Ruta Alpina": [
            (46, 7.5), (46.0022,7.52)
        ]
    ]
    
    static func showAllRoutes () {
        Route.showRoute(routeName: "Ruta del Pico Nevado y Lago Helado")
        Route.showRoute(routeName: "Ruta del Valle Blanco y Refugio Alpino")
        Route.showRoute(routeName: "Ruta de Cumbre Azul y Cerro Plateado")
        Route.showRoute(routeName: "Ruta del Bosque Nevado y Cascada Blanca")
        Route.showRoute(routeName: "Ruta completa de Alpina Grande a Cascade Blanca")
        Route.showRoute(routeName: "Ruta Alpina")
        print("Ruta del Refugio Aislado - 0.0 km")
    }
    
    static func showRoute (routeName: String) {
        if let route = rutas[routeName] {
            var totalDistance: Double = 0.0
            
            //Cacular distancia entre 2 puntos
            
            for i in 0..<route.count-1 {
                let point1 = route[i]
                let point2 = route[i+1]
                
                let distance = RouteFuncions.calculateDistance(lat1: point1.lat, long1: point1.long, lat2: point2.lat, long2: point2.long)
                totalDistance += distance
            }
            print("\(routeName) - \(String(format: "%.2f", totalDistance)) km")
        }
        else {
            print("La ruta no existe")
        }
    }
}

