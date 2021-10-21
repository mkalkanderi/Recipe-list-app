//
//  ContentView.swift
//  Recipe list app
//
//  Created by Mohd on 4/10/21.
//

import SwiftUI

struct RecipeListView: View {
    // MARK: - VARS

    @EnvironmentObject var model:RecipeModel
    
    // MARK: - body
    var body: some View {
        NavigationView {
            
            
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    //MARK: ROW ITEM
                    label: {
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                    })
                
            }
            .navigationBarTitle("All Recipes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
