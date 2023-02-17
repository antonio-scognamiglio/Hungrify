//
//  FullRecipe.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 23/11/21.
//

import SwiftUI

struct FullRecipe: View {

    @State var indiceRicetta: Int
    
    var body: some View {
        
        ScrollView {
        FullRecipeNoScroll(indiceRicetta: indiceRicetta)
    }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    ShareLink(item: render(view: FullRecipeNoScroll(indiceRicetta: indiceRicetta)))
                }
            }
    }
}

struct FullRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipe(indiceRicetta: 2)
        
    }
}
