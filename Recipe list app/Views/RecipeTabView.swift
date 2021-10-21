//
//  RecipeTabView.swift
//  Recipe list app
//
//  Created by Mohd on 9/10/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView{
            Text("Featured view")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                        
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                        
                    }
                }
            
        }
        .environmentObject(RecipeModel())
        
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
