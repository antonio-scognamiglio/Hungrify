//
//  FavoritesView.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 22/11/21.
//

import SwiftUI

struct FavoritesView: View {
    
    var body: some View {
        NavigationView {
        VStack(spacing: 30){
        BarraPreferiti(immagine: "BananaBread", testoImmagine: "Banana Bread")
        BarraPreferiti(immagine: "Insalata", testoImmagine: "Vegetable Salad")
        
            BarraPreferiti(immagine: "CurryRice", testoImmagine: "Curry Rice")
            
        BarraPreferiti(immagine: "PancakeProteico", testoImmagine: "Pancake Proteico")
    }.navigationTitle("Favorites")
                .navigationBarItems(trailing: NavigationLink(destination: Settings()) {
                    Image(systemName: "slider.horizontal.3").foregroundColor(Color(UIColor(named: "RossoLabel")!))
                    
                    }

                )
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
