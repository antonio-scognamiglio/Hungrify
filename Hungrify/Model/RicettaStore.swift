//
//  RicettaStore.swift
//  Foodify
//
//  Created by Antonio Scognamiglio on 23/11/21.
//

import Foundation

// è di tipo observable object, perché in questo modo tutte le view e l'app possono accedere a questa classe

class RicettaStore: ObservableObject {
    //    il contrario di private, possono accedere da dovunque
    //    se non faccio observable non posso accedere dalle mie View a questa classe
    @Published var arrayRicette: [Ricetta] = [ricetta1, ricetta2, ricetta3, ricetta4, ricetta5, ricetta6, ricetta7, ricetta8, ricetta9, ricetta10] // nelle classi si inizializza sempre, oppure ci vuole un costruttore -> init
    //    dove sta ricetta 1 devono essere inserite tutte le ricette, diciamo il database di ricette
    
    //
    //    func randomRecipe ()  -> Ricetta {
    //        var posizioneRandomRicetta: Int
    //        let indiceElementi = arrayRicette.count
    //        posizioneRandomRicetta = Int.random(in: 0..<indiceElementi)
    //        return arrayRicette[posizioneRandomRicetta]
    //
    //    }
    
    
    func randomRecipe ()  -> Int {
        var posizioneRandomRicetta: Int
        let indiceElementi = arrayRicette.count
        posizioneRandomRicetta = Int.random(in: 0..<indiceElementi)
        return posizioneRandomRicetta
        
    }
}


//ho dovuto craere per forza una classe, perché solo le classi possono essere ObservableObject e quindi essere passate alle varie views

class RicetteSalvate: ObservableObject {
    @Published var arrayRicetteSalvate: [Ricetta] = []
}


//class RicettaRandom: ObservableObject { // questa è una prova
//    @Published var ricettaRandom: Ricetta = ricetta1
//}



// creazione ricetta
var ricetta1 = Ricetta(recipeName: "Curry Rice", description: "Curry rice is an easy side dish recipe, perfect for serving with your favorite curries. A few pantry staples is all you need for this delicious dish.", ingredients: ["Basmati rice","Onion","Garlic and ginger","Curry powder", "Water", "Frozen peas", "Salt"], steps: ["1 - Heat a tablespoon of oil in a medium-sized pot. Add the onion and saute until soft and translucent.", "2 - Add the garlic, ginger and spices and cook for 30 seconds.", "3 - Stir in the rice then pour in the water/stock and season with salt.", "4 - Allow to simmer until most of the water has been absorbed then stir in the peas.", "5 - Cover with a lid then turn the heat down to its lowest setting.", "6 - Allow to cook gently for 5 minutes then turn the heat off and allow the rice to steam for 10 minutes.", "Once cooked, fluff with a fork, season to taste and serve."], favorite: false, imageName: "CurryRiceOriginal", cookingTime: 30)

var ricetta2 = Ricetta(recipeName: "Spring veg and lemon broth", description: "This recipe for spring veg and lemon broth is a quick, easy and healthy meal to make midweek.", ingredients: ["Celery", "Olive oil", "Butter", "Leeks","Garlic", "Vegetable stock", "Small pasta shapes"], steps: ["1 - Soften the celery in 1 tbsp oil and the butter for 5 minutes in a large pan, then add the leaks and soften for 5 more minutes.", "2 - Stir the garlic, cook for a minute, then add the stock and bring to the boil.", "3 - Tip in the pasta, boil for 4 minutes then add the greens, and cook for another 4 minutes until the pasat and the greens are tender.", "4 - Stir in the chopped basil, stir in the lemon juice and zest and divide between bowls.", "5 - Scatter with a little cheese to serve."], favorite: false, imageName: "springVegBroth", cookingTime: 20)

var ricetta3 = Ricetta(recipeName: "Chargrilled tuna", description: "Check out this flavour-packed tuna steack with zingy lemon bulgur wheat salad", ingredients: ["Tuna steaks", "Olive oil", "Lemon", "Garlic", "Red onion", "Celery","Baby plum tomatoes"], steps: ["1 - To make the salad, put all the ingredients except the bulgar in a bowl, season reallywell then toss together. The garlic is there to help flavour the salad without becoming overpowering so discard it before serving.", "2 - Put the bulgur wheat in a bowl and just cover with boiling water. Cover with clingfilmthen leave for 20 minutes. Drain really well then tip into kitchen paper and cool.Add to the salad bowl and toss.", "3 - Heat a griddle pan to very hot. Rub the tuna with oil, season well then griddle for 1-2 minutes per side depending on thickness. Put on a plate and rest for a minute.", "4 - Give the salad one final toss and throw away the garlic. Spoon the salad into plates then slice the tuna in half and sit on top. Serve with the lemon wedges."], favorite: false, imageName: "tunaSteak", cookingTime: 30)

var ricetta4 = Ricetta(recipeName: "Chicken parmigiana", description: "Healthy and low-fat parmigiana with a chicken flavour!", ingredients: ["Dried breadcrumbs", "Parmesan or grana", "Chicken breasts", "Egg", "Tomato souce", "Mozzarella", "Rocket"], steps: ["1 - Heat the oven to 200C/fan 180C/gas 6. Mix the breadcrumbs and grated parmesan and season.", "2 - Cut the chicken breasts through the middle and open up like a book but keep the two sides connected. Put between sheets of clingfilm and bash them with a rolling pin until 1/2 cm thick. Dust the escalopes in the flour, dip in the beaten egg, then coat them in the parmesan breadcrumbs.", "3 - Heat a splash of oil in a non-stick pan. Cook the chicken for 2-3 minutes on each side until crisp and golden.", "4 - Lift the chicken onto a baking sheet. Spoon over the tomato sauce, add some basil, then top with the mozzarella and more parmesan. Bake for 15 minutes, until the cheese is melted and bubbling. Serve with the rocket dressed with 1 tsp each of balsamic and olive oil." ], favorite: false, imageName: "PolloParmigiana", cookingTime: 30)

var ricetta5 = Ricetta(recipeName: "Kimchi noodles", description: "Korean flavoured noodles with eggs, light and delicious!", ingredients: ["Udon noodles", "Toasted sesame", "Green beans", "Kimchi", "Eggs", "Soy souce", "Red chilli"], steps: ["1 - Put the noodles in a sieve over the sink and pour over a kettle of just-boiled water. Toss to separate the noodles. Leave to drain.", "2 - Heat ½ tbsp of the oil in a wok or pan over a high heat, add most of the spring onions and all the green beans, and stir-fry for 2-3 minutes until the beans are just tender. Stir in the ginger and kimchi, and fry for another minute. Add the noodles and toss everything together for 2 minutes until the noodles are piping hot.", "3 - Meanwhile, heat the remaining oil in a small non-stick frying pan, and fry the eggs until the edges are crispy and the yolks are cooked to your liking. Sprinkle over the sesame seeds and cook for 30 seconds more, spooning the oil and seeds over the eggs.", "4 - Add the soy sauce to the noodles and toss. Top with the eggs. Spoon over any remaining seeds and oil, and top with the chilli, if using."], favorite: false, imageName: "Kimchi", cookingTime: 20)

var ricetta6 = Ricetta(recipeName: "Shakshuka", description: "A classic brunch dish, shakshuka is vegetarian and quick and easy to make - spices, peppers, tomatoes and eggs bubbled up in a pan", ingredients: ["Tomatoes", "Onion", "Garlic", "Roasted peppers", "Eggs", "Chilli and paprika", "Parsley"], steps: ["1 - Heat a large frying pan with a lid. Cook the onion and garlic in 2 tbsp olive oil until soft, then stir in the peppers, spices, tomatoes and sugar and simmer for 10 minutes. Make 4 dips in the mixture with the back of a spoon and crack an egg into each.", "2 - Put the lid on and cook gently until the whites are set and the yolks cooked how you like them. Scatter with parsley and serve with bread or toast."], favorite: false, imageName: "Shakshuka", cookingTime: 30)

var ricetta7 = Ricetta(recipeName: "Healthy Tacos", description: "Healthy Tacos made with seasoned black beans, an easy corn salsa, fresh avocado, and a delicious cilantro “pesto”.  Made with wholesome, good-for-you ingredients, these are the BEST healthy tacos ever! These tacos are vegetarian but trust me.", ingredients: ["Red onion", "Cider vinegar", "Smoked paprikan", "Ground cumin", "Chipotle flakes", "Olive oil","Courgettes"], steps: ["1 - Combine the onion and vinegar in a small bowl with a pinch of salt and set aside.Mix the paprika, cumin, chipotle flakes and 2 tbsp of olive oil in a large bowl,seasoning well. Add the courgettes and toss together until coated. Put a large frying pan on a medium-high heat and, once hot, add the courgettes – you will probably need to do this in two or three batches. Cook on each side for 2-3 minutes or until deep in colour and charred, then transfer to a plate lined with kitchen paper. Cover and set aside.", "2 - Without cleaning the frying pan, add the remaining oil. Cook the garlic for 30 seconds, then add the black beans with a splash of water, cooking through for a few minutes until just warm and the water has evaporated. Season to taste, cover and set aside", "3 - Finely chop half the coriander and put in a bowl along with the yogurt, lime juice and zest, mix together and season to taste. Heat the tortillas according to pack instructions.", "4 - Strain the pickled onions. When it’s time to build your tacos, layer the tortillas with the salad leaves and avocado. Sprinkle over the black beans and top with the courgettes, a drizzle of the herby lime yogurt and some of the pickled onions. Garnish with the remaining coriander (you can keep as is, or roughly chop if you’d prefer) and serve with the lime wedges to squeeze over."], favorite: false, imageName: "HealthyTacos", cookingTime: 30)

var ricetta8 = Ricetta(recipeName: "Courgette frittata", description: "This vegetarian frittata is the perfect summer lunch. Courgette, spring onions and goat's cheese are an irresistible flavour combination.", ingredients: ["Olive oil", "Courgette", "Garlic", "Dried chilli flakes", "Eggs", "Goat’s cheese","Spring onion"], steps: ["1 - Preheat the grill. Heat the olive oil in„ a 20cm ovenproof frying pan and add the sliced courgette. Fry for 4-5 minutes over a high heat or until browned. Add the garlic and dried chilli flakes, and cook for 1 minute.", "2 - Lower the heat to medium. Tip in the eggs, and season generously. Cook until set around the edges.", "3 - Dot the top with the goat’s cheese and slide under the hot grill. Cook until browned on top then scatter with the spring onions and serve with a leafy green salad."], favorite: false, imageName: "CourgetteFrittata", cookingTime: 20)

var ricetta9 = Ricetta(recipeName: "Salmon tartare", description: "All the flavour of salmon in a healty and delicious version!", ingredients: ["Shallot", "Lemon", "Salmon fillet", "Smoked Salmon", "Capers", "Toast", "Dill"], steps: ["1 - Put the shallot in the lemon juice and leave to soak. Cut the salmon into tiny cubes and finely chop the smoked salmon. Put all the fish into a bowl, add the dill, capers, mustard, crème fraîche,lemon or olive oil and the shallot and juice. Fold it all together and season with black pepper and salt if needed. Serve in neat rounds with melba toast and lemon wedges on the side, and drizzle with a little more lemon oil"], favorite: false, imageName: "SalmonTar", cookingTime: 25)

var ricetta10 = Ricetta(recipeName: "Veggie fajitas", description: "Quick and delicious black bean fajita, a flavorful, satisfying meal that’s packed with plant-based protein.", ingredients: ["Red Pepper", "Onion", "Cumin", "Black beans", "Tortillas", "Cheddar", "Sour crean"], steps: ["1 - Toss all the salsa ingredients together with a good pinch of salt and leave to sit while you make the fajitas", "2 - Heat 1 tbsp of oil in a large pan and cook the onion and pepper over a high heat until softened and starting to char at the edges. Turn down the heat and add the spices, tossing well. Add the beans with a splash of water and keep cooking until the beans are piping hot.", "3 - Serve the beans in warm tortillas with the salsa, cheese, soured cream and hot sauce, if you like."], favorite: false, imageName: "VegFaj", cookingTime: 30)
