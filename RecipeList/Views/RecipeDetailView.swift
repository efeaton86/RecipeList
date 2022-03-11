//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/10/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // could add recipe title here, but will add at naviagtion link
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• " + ingredient)
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
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass to view
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
