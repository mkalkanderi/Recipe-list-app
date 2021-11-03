//
//  RecipeDetailView.swift
//  Recipe list app
//
//  Created by Mohd on 5/10/21.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: - vars (state vars)

    var recipe: Recipe
    @State var selctedServingSize = 2
    
    // MARK: - body (view code)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // picker
                VStack(alignment: .leading) {
                    Text("Serving Size")
                    Picker("", selection: $selctedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // ingriendeints
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("- " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selctedServingSize) + " " + item.name)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                // divider
                Divider()
                    .padding(.vertical, 1.0)
                
                // directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0 ..< recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
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
