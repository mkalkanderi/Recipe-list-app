//
//  DataService.swift
//  Recipe list app
//
//  Created by Mohd on 4/10/21.
//

import Foundation

class DataService {
    
    
    static func getLocalData() -> [Recipe] {
        // get the path string
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // check if nil
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // if not nil, create url from pathString
        let url = URL(fileURLWithPath: pathString!)
        // create data object using the url
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
                
            } catch {
                print(error)
            }

        } catch {
            print(error)
        }
        return [Recipe]()
    }
}
