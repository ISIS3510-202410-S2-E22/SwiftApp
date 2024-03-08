//
//  ForYouViewModel.swift
//  FoodBookApp
//
//  Created by Juan Diego Yepes Parra on 29/02/24.
//

import Observation
import Foundation
import CoreLocation

@Observable
class ForYouViewModel {
    var spots: [Spot] = []
    
    func fetchRecommendedSpots(uid:String) async throws -> [Spot] {
//        TODO: This should read from API and append every spot to spots
        try await Task.sleep(nanoseconds: 20000)
        
        spots = [
            Spot(
                id: "id-3",
                name: "Gratto",
                minTime: 5,
                maxTime: 10,
                distance: 0.3,
                latitude: 0.0,
                longitude: 0.0,
                categories: ["Coffee", "Pastry", "Snack", "..."],
                imageLinks: [
                    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=2380&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1493770348161-369560ae357d?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1498837167922-ddd27525d352?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1529042410759-befb1204b468?q=80&w=2486&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                ]
            ),
            
            Spot(
                id: "id-4",
                name: "Happy Snacks",
                minTime: 25,
                maxTime: 30,
                distance: 0.5,
                latitude: 0.0,
                longitude: 0.0,
                categories: ["Vegan", "Salad", "Bowl", "Healthy", "..."],
                imageLinks: [
                    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=2380&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1493770348161-369560ae357d?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1498837167922-ddd27525d352?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1529042410759-befb1204b468?q=80&w=2486&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                ]
            )
        ]
        return spots
    }
    
}