//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/10/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes: [Recipe]
    
    init() {
        self.recipes = DataService.getLocalData()
    }
    
}
