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
        ]
    ]
    
    static func showAllRoutes () {
        
    
    
    
        
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

