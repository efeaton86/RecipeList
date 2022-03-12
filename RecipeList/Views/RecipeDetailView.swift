//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/10/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    // defaulted to 2 servings
    @State var selectedServingSize = 2
    
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                }
                .padding()
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(recipe.ingredients) { ingredient in
                        Text("• \(RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServingSize: selectedServingSize)) \(ingredient.name.lowercased())")
                    }
                }.padding(.horizontal)
                
                // MARK: Dividider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { idx in
//                        Text(String(idx+1) + ". " + recipe.directions[index])
                        Text("\(idx + 1). \(recipe.directions[idx])")
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
//        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass to view
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
