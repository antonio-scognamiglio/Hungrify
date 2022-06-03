//
//  Ricetta.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 23/11/21.
//

import Foundation

struct Ricetta: Identifiable {
   let id = UUID()
// serve perché l'abbiamo fatto di tipo Identifiable e richiede un id, quindi in poche parole con questa cosa ogni ricetta avrà un suo id, serve per indicizzare il contenuto, non è proprio un indice ma simile a quello dell'array
//    ogni istanza di Ricetta avrà un codice univoco
    var recipeName : String
    var description: String
    var ingredients: [String]
    var steps: [String]
    var favorite: Bool = false
    var imageName: String
    var cookingTime: Int
}
