//
//  ContentView.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 19/11/21.
//

import SwiftUI

struct RecipesView: View {
    
    @EnvironmentObject var ricettaStore: RicettaStore
   
//    ho creato un esemplare di Ricetta Store, di quella classe, con al suo interno la variabile array
//    il nome può essere qualsiasi ma per convenzione si mette lo stesso nome con la lettera minuscola, ovunque
    @State private var shouldShowOnBoarding = true
   
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: RandomRecipe()) {
                ZStack{
                    Image(uiImage: UIImage(named: "RandomTap.png")!)
                    Text("Tap n'cook!")
                        .foregroundColor(.white)
                        .font(.system(size: 48))
                        .fontWeight(.semibold)
                        .frame(width: 300, height: 40)
                        .padding(.top, 270)
                        .padding(.trailing, 65)
                }
                }
                
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 355, height: 139)
                        .shadow(radius: 24)
                        .foregroundColor(.white)
                    VStack(alignment: .leading){
                        Text("LAST RECIPE")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(UIColor(named: "RossoLabel")!))
                            .font(.system(size: 18))
                        
                        HStack(alignment: .top, spacing: 50){
                            Image(uiImage: UIImage(named: "SmallCurryRice.png")!)
                            VStack(alignment: .leading) {
                                Text("Curry Rice").fontWeight(.semibold)
                                Text("Cooking time:\n30 min").foregroundColor(.secondary)
                            }
                        }
                    }.padding(.leading, 30)
                }
                Spacer()
            }
//            .onTapGesture {
//                print(indiceRicetta)
//                indiceRicetta = ricettaStore.randomRecipe()
//                print(indiceRicetta)
//            }
            .navigationTitle("Recipes")
        }.sheet(isPresented: $shouldShowOnBoarding) {
            OnBoardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
