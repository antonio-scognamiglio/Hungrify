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
    @State var imageFromView: Image? = nil
    @State var pdfUrl: URL?
    
    // Questa sotto, sostanzialmente è la view che sarà convertita prima in image e poi in pdf
    // Proprio Paul suggerisce di creare la View come property
    var myView: some View {
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
    }
    
    // solo il body si vede nell'app, quindi questo è ciò che lo user vede
    var body: some View {
        VStack {
            ScrollView {
                myView
            }
        }
        .task {
            if pdfUrl == nil {
                if imageFromView == nil {
                    imageFromView = Image(uiImage: myView.snapshot())
                }
                pdfUrl = await render(view: imageFromView)
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
    }
}


struct FullRecipeNoScroll_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipeView(indiceRicetta: 2).environmentObject(RicettaStore())
        
    }
}