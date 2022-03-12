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
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServingSize: Int) -> String {

        var wholePortions = 0
        var portion = ""
        var numerator = ingredient.num ?? 1  // if ingredient is nil, set numerator to 1
        var denominator = ingredient.denom ?? 1  // if ingredient is nil, set numerator to 1
        
        
        
        if ingredient.num != nil {
            denominator *= recipeServings
            numerator *= targetServingSize
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                // wholePortion is an int, so any remainder will be dropped
                wholePortions = numerator / denominator
                // calculate remainder
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit {
            // making ingredient UOM plural
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        return portion
    }
    
}
