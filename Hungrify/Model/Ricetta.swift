//
//  Ricetta.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 23/11/21.
//

import Foundation

struct Ricetta: Identifiable {
   let id = UUID()

    var recipeName : String
    var description: String
    var ingredients: [String]
    var steps: [String]
    var favorite: Bool = false
    var imageName: String
    var cookingTime: Int
}
