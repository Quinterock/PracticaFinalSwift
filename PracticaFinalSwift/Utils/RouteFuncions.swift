//
//  RouteFuncions.swift
//  PracticaFinalSwift
//
//  Created by Luis Quintero on 09/02/25.
//
import Foundation

struct RouteFunctions {
    static func calculateDistance(lat1: Double, long1: Double, alt1: Double,
                                  lat2: Double, long2: Double, alt2: Double) -> Double {
        let R = 6371.00 // Radio de la Tierra en km
        
        // Convertir grados a radianes
        let lat1_rad = lat1 * .pi / 180.0
        let lat2_rad = lat2 * .pi / 180.0
        let lon1_rad = long1 * .pi / 180.0
        let lon2_rad = long2 * .pi / 180.0
        
        // Aplicar la fórmula del coseno esférico
        let surfaceDistance = R * acos(
            cos(lat1_rad) * cos(lat2_rad) +
            sin(lat1_rad) * sin(lat2_rad) * cos(lon1_rad - lon2_rad)
        )
        
        // Calcular la diferencia de altitud en km
        let altDifference = (alt2 - alt1) / 1000.0
        
        // Aplicar Pitágoras para obtener la distancia 3D
        let distance3D = sqrt(pow(surfaceDistance, 2) + pow(altDifference, 2))
        
        return distance3D
    }
}
