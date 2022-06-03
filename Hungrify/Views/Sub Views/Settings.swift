//
//  Settings.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 20/11/21.
//

import SwiftUI

struct Settings: View {
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 20){
                Text("Settings")
                    .fontWeight(.bold)
                    .font(.largeTitle)
//                    .padding(.bottom)
                Text("Difficulty Level")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                
                HStack (spacing: 20){
                    FilterButton(buttonText: "Easy")
                    FilterButton(buttonText: "Medium")
                    FilterButton(buttonText: "Hard")
                }.padding(.bottom, 40.0)
                
                Text("Cooking Styles")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                
                HStack (spacing: 20){
                    FilterButton(buttonText: "Italian")
                    FilterButton(buttonText: "Spanish")
                    FilterButton(buttonText: "Greek")
                }
                
                FilterButton(buttonText: "Random")
                    .padding(.bottom, 40.0)
                Text("Dieting Categories")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
            
                HStack (spacing: 20){
                    FilterButton(buttonText: "Dairy Free")
                    FilterButton(buttonText: "Flexible")
                    FilterButton(buttonText: "Vegan")
                }
                
                HStack (spacing: 20){
                    FilterButton(buttonText: "Wheith Free")
                    FilterButton(buttonText: "Vegeterian")
                }.padding(.bottom, 240.0)
                
            }
//            .navigationTitle("Settings")
            /// qua non so se si mette il nome perché sono settaggi all'interno di una view, e se lo metto c'è troppa distanza dal back alla view precedente
//            .navigationBarItems(trailing: Button("Reset", action: {
////                qua devo fare in modo che tutti i bottoni si disattivano
//            }))
            
        }
    }
}



struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
