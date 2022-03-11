//
//  RecipeListView.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/10/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(
                    destination: RecipeDetailView(recipe: recipe),
                    label: {
                        HStack(spacing: 20) {
                            Image(recipe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(recipe.name)
                        }
                })
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeListView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
