//
//  OnBoardingView.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 20/11/21.
//

import SwiftUI

struct OnBoardingView: View {
    
    @Binding var shouldShowOnBoarding: Bool
    //in pratica questo binding significa che la variabile shouldShowOnBoarding è legata a qualcosa che non è presente qui ma è dello stesso tipo, cioè bool, in poche parole serve per far comunicare diverse View se ho capito bene, e si dovrebbe collegare alla @State var shouldShowOnBoarding che si trova nella RecipesView, se ho capito bene il nome non è importante basta che sono dello stesso tipo
    
    var body: some View {
        VStack(spacing: 90){
            Text("Welcome to Hungrify!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 240, height: 82, alignment: .center)
            
            VStack(spacing: 50.0){
                HStack (spacing: 25){
                    Image(systemName: "hand.tap")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 4.0)
                        .frame(width: 48, height: 48, alignment: .center)
                    
                        Text("Get random recipes and stay fit")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .frame(width: 228, height: 45, alignment: .leading)
                }
                HStack (spacing: 25){
                    Image(systemName: "heart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 5.0)
                        .frame(width: 48, height: 48, alignment: .center)
                        
                        
                    Text("Save your favorite one with a single tap")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .frame(width: 228, height: 45, alignment: .leading)
                    
                }
                HStack (spacing: 25){
                    
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 5.0)
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    Text("Set your food preferences once and for all")
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .frame(width: 228, height: 45, alignment: .leading)
                }
            }
            
            Button(action: {
                shouldShowOnBoarding = false
                
            }) {
                ZStack{
                RoundedRectangle(cornerRadius: 12)
                    Text("Start").foregroundColor(.white)
                }
                
                .frame(width: 300.0, height: 45.0)
                .padding(.top, 90.0)
            }
            }
  
    }
    }
    


struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
