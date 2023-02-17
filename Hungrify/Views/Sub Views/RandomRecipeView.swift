//
//  RandomRecipe.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 23/11/21.
//

import SwiftUI

struct RandomRecipe: View {
	
	@StateObject var ricettaStore = RicettaStore()
	@State var indiceRicetta: Int = 0
	
	var body: some View {
		VStack{
			ZStack{
				Image(uiImage: UIImage(named: ricettaStore.arrayRicette[indiceRicetta].imageName)!)
					.resizable()
					.scaledToFill()
					.frame(width: 390, height: 620)
					.blur(radius: 20)
				RoundedRectangle(cornerRadius: 23)
					.frame(width: 370, height: 580, alignment: .center)
					.foregroundColor(.white)
					.shadow(radius: 24)
				VStack {
					Text("You Got a New Recipe!")
						.foregroundColor(Color(UIColor(named: "RossoLabel")!))
						.fontWeight(.semibold)
						.font(.system(size: 28))
					Image(uiImage: UIImage(named: ricettaStore.arrayRicette[indiceRicetta].imageName)!)
						.resizable()
						.frame(width: 280, height: 185)
						.scaledToFill()
						.clipShape(RoundedRectangle(cornerRadius: 23.0))
					
					Text(ricettaStore.arrayRicette[indiceRicetta].recipeName)
						.foregroundColor(.black)
						.fontWeight(.semibold)
						.font(.system(size: 24))
						.padding(.vertical, 3)
					
					HStack(alignment: .top){
						VStack(alignment: .leading){
							Text("Main Ingredients")
								.fontWeight(.medium)
							
							ForEach(ricettaStore.arrayRicette[indiceRicetta].ingredients, id: \.self) { ingredient in
								Text(ingredient.capitalized)
									.foregroundColor(.secondary)
							}
							
							
							ZStack{
								RoundedRectangle(cornerRadius: 10)
									.foregroundColor((Color(UIColor(named: ("GrigioButton"))!)))
								
								Text("TRY AGAIN").foregroundColor(Color(UIColor(named: "GrigioTestoButton")!))
							}
							.frame(width: 100, height: 45.0)
							//                            .offset(y: 28)
							.padding(.top, 3)
							.onTapGesture {
								indiceRicetta =   ricettaStore.randomRecipe()
							}
							
						}.frame(width: 130, height: 230)
						
						VStack(alignment: .leading){
							Text("Cooking Time")
								.fontWeight(.medium)
							Text("\(ricettaStore.arrayRicette[indiceRicetta].cookingTime) min")
								.foregroundColor(.secondary)
							
                            NavigationLink(destination: FullRecipeNoScroll(indiceRicetta: indiceRicetta)) {
								ZStack{
									RoundedRectangle(cornerRadius: 10)
										.foregroundColor((Color(UIColor(named: ("RossoButton"))!)))
									
									Text("COOK!").foregroundColor(Color(UIColor(named: "Color")!))
								}
								.frame(width: 100, height: 45.0)
								//                            .offset(y: 110)
								.padding(.top, 125)
							}
							
						}.frame(width: 130, height: 230)
						
						
					}
					
				}
			}
		}
		.onAppear{
			indiceRicetta = ricettaStore.randomRecipe()
		}
		.environmentObject(ricettaStore)
		.padding(.bottom, 10)
		//            .navigationTitle("Random Recipe")
	}
}

struct RandomRecipe_Previews: PreviewProvider {
	static var previews: some View {
		RandomRecipe()
		
	}
}
