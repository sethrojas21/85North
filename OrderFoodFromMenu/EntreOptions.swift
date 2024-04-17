//
//  EntreOptions.swift
//  OrderFoodFromMenu
//
//  Created by Seth Rojas on 3/12/24.
//

import Foundation
import SwiftUI

struct Entree: Identifiable, Codable{
    var id = UUID()
    
    var name: String
    var protein: String
    var bean: String
    var rice: String
    var addOns: [String]
}

@Observable
class OrderEntree {
    var allOrders: [Entree] = [Entree(name: "Burrito", protein: "Steak", bean: "Pinto Beans", rice: "White Rice", addOns: [])]
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Entree") {
            if let decodedItems = try? JSONDecoder().decode([Entree].self, from: savedItems) {
                allOrders = decodedItems
                return
            }
        }

        allOrders = []
    }
    
    func save(){
        if let encoded = try? JSONEncoder().encode(allOrders) {
            UserDefaults.standard.set(encoded, forKey: "Entree")
        }
    }
    
    static var breakfastOptions: [String] = []
    static var lunchOptions: [String] = []
    static var dinnerOptions: [String] = []
}
