//
//  RecipeFeaturedView.swift
//  Recipe list app
//
//  Created by Mohd on 14/10/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    // MARK: - vars

    @EnvironmentObject var model: RecipeModel
    
    // MARK: - var body

    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            //title
            Text("Featured Recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
                .padding(.leading)
            
            //card
            GeometryReader { geo in
                TabView {
                    ForEach(0 ..< model.recipes.count) { index in
                        
                        if model.recipes[index].featured {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    
                                
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x:-5,y:5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            //info
            VStack(alignment: .leading, spacing: 10) {
                Text("Prepartion Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy and delciususus")
            }
            .padding([.leading, .bottom])
        }
        
    }
}

// MARK: - Preview

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
