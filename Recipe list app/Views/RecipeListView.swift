//
//  ContentView.swift
//  Recipe list app
//
//  Created by Mohd on 4/10/21.
//

import SwiftUI

struct RecipeListView: View {
    // MARK: - VARS
    
    @EnvironmentObject var model: RecipeModel
    @State var selectedIndex = "1"
    // MARK: - body
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Title
                Text("All Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                // the list
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                
                                // MARK:- ROW ITEM
                                
                                label: {
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                })
                        }
                    }
                }
               
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
