//
//  FullRecipeView.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 17/02/23.
//

import SwiftUI

struct FullRecipeView: View {
    @StateObject var ricettaStore = RicettaStore()
    @State var indiceRicetta: Int
//    @State var imageFromView: Image? = nil
    @State var pdfUrl: URL?
    
    // Questa sotto, sostanzialmente è la view che sarà convertita prima in image e poi in pdf, questo approccio, serve per via della Scroll View, altrimenti, le dimensioni del PDF non sono mai reali quando prova a prenderli dalla Scroll View e qualcosa viene tagliato
    // Si può anche evitare di fare in questo modo e fare tutto in una view, utilizzando la funzione snap sulla view stessa self.snapshot(), ma questo è un easy fix alla scroll View
    var myView: some View {
            VStack {
                Image(uiImage: UIImage(named: ricettaStore.arrayRicette[indiceRicetta].imageName)!)
                    .resizable()
                // questo frame è importante perché l'immagine nonostante il frame al Vstack, durante la cattura con snapshot, esce sgranata, resizata male
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: 240)
                    .scaledToFill()

                HStack{
                    Text(ricettaStore.arrayRicette[indiceRicetta].recipeName)
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(UIColor(named: "RossoLabel")!))
                        .font(.system(size: 30))
                }
                .padding(.top, 15)
                
                VStack (alignment: .leading){
                    Text("Description")
                        .foregroundColor(Color(UIColor(named:"RossoLabel")!))
                        .fontWeight(.semibold)
                        .font(.system(size: 21))
                        .padding(.top, 3)
                    
                    Text(ricettaStore.arrayRicette[indiceRicetta].description)
                        .font(.system(size: 21))
                        .fontWeight(.regular)
                        .padding(.top,1)
                    
                    Text("Ingredients")
                        .foregroundColor(Color(UIColor(named:"RossoLabel")!))
                        .fontWeight(.semibold)
                        .font(.system(size: 21))
                        .padding(.top, 3)
                    
                    
                    ForEach(ricettaStore.arrayRicette[indiceRicetta].ingredients, id: \.self) { ingredient in
                        Text(ingredient.capitalized)
                            .font(.system(size: 21))
                            .fontWeight(.regular)
                    }
                    
                    Text("Cooking")
                        .foregroundColor(Color(UIColor(named:"RossoLabel")!))
                        .fontWeight(.semibold)
                        .font(.system(size: 21))
                        .padding(.top, 3)
                    ForEach(ricettaStore.arrayRicette[indiceRicetta].steps, id: \.self) { step in
                        Text(step)
                            .font(.system(size: 21))
                            .fontWeight(.regular)
                            .padding(.top,1)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.95)
        
    }
    
    var body: some View {
        ScrollView {
            myView
                .task {
                    if pdfUrl == nil {
                        pdfUrl = await render(view: myView)
                        print("*************Test dell'Url*************")
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
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct FullRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipeView(indiceRicetta: 2).environmentObject(RicettaStore())
        
    }
}
