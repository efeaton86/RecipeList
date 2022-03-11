//
//  DataService.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/10/22.
//

import Foundation

struct DataService {
    
    static func getLocalData() -> [Recipe] {
        //parse local json
        guard let pathString = Bundle.main.path(forResource: "recipes", ofType: "json") else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                return recipeData
            } catch  {
                print("error parsing json")
            }
            
        } catch  {
            print(error)
            print("url error")
        }
        return [Recipe]()
    }
}
