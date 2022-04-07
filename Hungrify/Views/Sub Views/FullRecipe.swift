//
//  FullRecipe.swift
//  Foodify
//
//  Created by Antonio Scognamiglio on 23/11/21.
//

import SwiftUI

struct FullRecipe: View {
//    Se ho capito bene questo EnvironmentObject qua viene usato per creare una variabile chiamata ricettaStore che è di tipo RicettaStore, però in maniera molto semplificata a me sembra di capire che il contenuto della classe RicettaStore è stato salvato in ricettaStore, cioè una copia in questa view di quell'elemento madre, ed è stata creata una classe perché le classi possono essere di tipo ObservableObject e quindi essere passate alle View figlie
    
    @StateObject var ricettaStore = RicettaStore()
    @Binding var indiceRicetta: Int


    var body: some View {
        
        ScrollView {
        VStack(alignment: .center){
            Image(uiImage: UIImage(named: ricettaStore.arrayRicette[indiceRicetta].imageName)!)
                .resizable()
                .frame(width: 420, height: 240)
                .scaledToFill()
                
            
            VStack(alignment: .leading){
                HStack(alignment: .center){
                    
//                    tentativo di uso della funzione che restituisce un numero random basato sulla grandezza dell'array
//
                    Text(ricettaStore.arrayRicette[indiceRicetta].recipeName)
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                        .frame(width: 350, alignment: .leading)
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(UIColor(named: "RossoLabel")!))
                        .font(.system(size: 30))
                }
                .padding(.top, 15)
                
//                ScrollView { //vecchia posizione della scroll View
                    VStack (alignment: .leading){
                        Group {
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
                        }
                        
                     
                        ForEach(ricettaStore.arrayRicette[indiceRicetta].ingredients, id: \.self) { ingredient in
                            Text(ingredient.capitalized)
                                .font(.system(size: 21))
                                .fontWeight(.regular)
//                                .padding(.vertical, 2)
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
            }.padding(.horizontal)
        }
        }
        .padding()
    }
}

struct FullRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipe(indiceRicetta:.constant(0)).environmentObject(RicettaStore())
    
    }
}



//                        ForEach(ricettaStore.arrayRicette, id: \.self) { ricetta in
//                            Text(ricetta1.recipeName)
//                            ForEach(ricetta1.ingredients, id: \.self){ ingredient in
//                                Text(ingredient)
//
//                            }
//                        }
