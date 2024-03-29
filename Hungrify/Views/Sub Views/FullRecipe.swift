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
    }
}

struct FullRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipe(indiceRicetta: 2)
        
    }
}


struct FullRecipeNoScroll: View {
    @StateObject var ricettaStore = RicettaStore()
    @State var indiceRicetta: Int
    @State var isShowing = false
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: ricettaStore.arrayRicette[indiceRicetta].imageName)!)
                .resizable()
                .frame(width: 420, height: 240)
                .scaledToFill()
            
            HStack{
                Text(ricettaStore.arrayRicette[indiceRicetta].recipeName)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                Spacer()
                Button ("Share"){
                    isShowing.toggle()
                }
                Image(systemName: "heart.fill")
                    .foregroundColor(Color(UIColor(named: "RossoLabel")!))
                    .font(.system(size: 30))
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
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
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
        .sheet(isPresented: $isShowing) {
            Prova(indiceRicetta: indiceRicetta)
        }
    }
}


struct FullRecipeNoScroll_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipeNoScroll(indiceRicetta: 2).environmentObject(RicettaStore())
        
    }
}

//                        ForEach(ricettaStore.arrayRicette, id: \.self) { ricetta in
//                            Text(ricetta1.recipeName)
//                            ForEach(ricetta1.ingredients, id: \.self){ ingredient in
//                                Text(ingredient)
//
//                            }
//                        }
