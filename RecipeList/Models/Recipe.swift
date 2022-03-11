//
//  Recipe.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/10/22.
//

import Foundation

struct Recipe: Identifiable, Codable {
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [String]
    var directions: [String]
    var id: String { name }
}
