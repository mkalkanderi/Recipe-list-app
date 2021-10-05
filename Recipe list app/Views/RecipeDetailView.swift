//
//  RecipeDetailView.swift
//  Recipe list app
//
//  Created by Mohd on 5/10/21.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: - vars

    var recipe: Recipe
    
    // MARK: - body

    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("- " + item)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                Divider()
                    .padding(.vertical, 1.0)
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 1)
                    }
                }
                
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
        
    }
}

// MARK: - Preview

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // create dummy recipe and pass it to detail view so we can preview it
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
