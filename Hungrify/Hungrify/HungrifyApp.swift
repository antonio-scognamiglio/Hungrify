//
//  FoodifyApp.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 19/11/21.
//

import SwiftUI

@main
struct HungrifyApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            TabView {
                RecipesView().tabItem {
                    Image(uiImage: UIImage(named: "fork.knife.circle.fill")!)
//                    Image(systemName: "fork.knife.circle.fill") //solo su iOS 15 è disponibile di sistema, quindi l'ho passata come immagine
                    Text("Recipes")
                     }.tag(1)
                FavoritesView().tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites") }.tag(2)
            }
        }
    }
}
