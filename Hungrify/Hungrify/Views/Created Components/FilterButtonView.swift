//
//  FilterButton.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 22/11/21.
// Questo è il nostro pulsante custom che riutilizziamo anche in Settings

import SwiftUI

struct FilterButton: View {
    
//    @State private var intensity: Double = 0
    @State private var colorePulsante: String = "GrigioButton"
    @State private var coloreTesto: String = "GrigioTestoButton"
    var buttonText = "MyButton"
    
    var body: some View {
        Button(action: {
//            intensity = intensity == 1 ? 0.1 : 1
            colorePulsante = colorePulsante == "RossoButton" ? "GrigioButton" : "RossoButton"
            coloreTesto = coloreTesto == "Color" ? "GrigioTestoButton" : "Color"
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor((Color(UIColor(named: (colorePulsante))!)))
//                    .opacity(intensity)
                    Text(buttonText).foregroundColor(Color(UIColor(named: coloreTesto)!))
            }
            .frame(width: 95, height: 45.0)
        }
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton()
    }
}
