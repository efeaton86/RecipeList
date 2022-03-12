//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by Eric Eaton on 3/11/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    
    @State var showDetailView = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    ForEach(0..<model.recipes.count) { idx in
                        if model.recipes[idx].featured {
                            // make the card function as a button
                            // Recipe Card
                            Button(
                                action: {
                                    self.showDetailView = true
                                    print(showDetailView)
                                },
                                label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                        VStack(spacing: 0) {
                                            Image(model.recipes[idx].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipped()
                                            Text(model.recipes[idx].name)
                                                .padding(5)
                                        }
                                    }
                                })
                                .sheet(isPresented: $showDetailView, content: { RecipeDetailView(recipe: model.recipes[idx]) })
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(20)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                                
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlightst")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
