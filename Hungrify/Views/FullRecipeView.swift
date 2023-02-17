//
//  FullRecipe.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 23/11/21.
//

import SwiftUI

struct FullRecipe: View {
    @State var indiceRicetta: Int
    @State var pdfUrl: URL?
    
    var body: some View {
        
        ScrollView {
        FullRecipeNoScroll(indiceRicetta: indiceRicetta)
    }
            .navigationBarTitleDisplayMode(.inline)
            .task {
                let url = await render(view: FullRecipeNoScroll(indiceRicetta: indiceRicetta))
                if pdfUrl == nil {
                    pdfUrl = url
                    print("*****************")
                    print(pdfUrl!)
                }
            }
            .toolbar {
                ToolbarItem {
                    if pdfUrl != nil {
                        ShareLink(item: pdfUrl!)
                    }
                }
            }
    }
}

struct FullRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipe(indiceRicetta: 2)
        
    }
}
