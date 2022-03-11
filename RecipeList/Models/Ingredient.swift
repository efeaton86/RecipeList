//
//  Ingredient.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/11/22.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    var id: String { name }
    
}
