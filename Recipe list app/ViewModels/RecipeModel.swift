//
//  RecipeModel.swift
//  Recipe list app
//
//  Created by Mohd on 4/10/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    
    init() {
        self.recipes = DataService.getLocalData()
    }
}
