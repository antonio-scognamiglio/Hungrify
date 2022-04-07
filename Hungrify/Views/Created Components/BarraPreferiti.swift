//
//  FavoriteTabView.swift
//  Foodify
//
//  Created by Antonio Scognamiglio on 22/11/21.
// Questa è la nostra barra dei preferiti, diciamo quel rettangolo, lo scopo è riutilizzarlo, cambiando il nome e l'immagine a seconda del contenuto

import SwiftUI

struct BarraPreferiti: View {
    var immagine: String = "BananaBread"
    var testoImmagine: String = "Banana Bread"
    
//    Queste due variabili servono per passare il nome dell'immagine quindi il nome che identifica proprio l'asset/file immagine, invece la seconda è il nome che deve apparire in overlay sull'immagine che ovviamente deve corrispondere all'immagine sotto
    
    var body: some View {
        ZStack{
            Group{
                Image(uiImage: UIImage(named: immagine)!).resizable()
                Image(uiImage: UIImage(named: "LayerFigo1")!).resizable()
            }
                .scaledToFill()
                .frame(width: 375, height: 130.0)
                .clipShape(RoundedRectangle(cornerRadius: 23.0))
            
            Text(testoImmagine)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 34))
                .multilineTextAlignment(.leading)
                .padding(.top, 70)
                .padding(.leading, 25)
                .frame(width: 375.0, alignment: .leading)
        }
        .shadow(radius: 24)
        
        
    }
}

struct BarraPreferiti_Previews: PreviewProvider {
    static var previews: some View {
        BarraPreferiti()
    }
}
