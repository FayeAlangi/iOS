//
//  DessertDetailView.swift
//  FetchDessert
//
//  Created by Faye Alangi on 11/7/23.
//

import SwiftUI

struct DessertDetailView: View {
    
    @StateObject var viewModel = DessertDetailsViewModel()
    
    let dessert : Dessert
    
    var body: some View {
        ScrollView{
            VStack {
                VStack{ Text(dessert.strMeal)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(10)
                    DessertRemoteImage(urlString: dessert.strMealThumb)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200,height: 200)
                        .shadow(radius: 5)
                        .cornerRadius(8)
                        .padding()
                    
                    Text("Recipe").font(.title3).fontWeight(.semibold)
                    Text(viewModel.dessertDetails.strInstructions!)
                        .multilineTextAlignment(.leading)
                        .font(.body)
                    .padding()}
                 Text("Ingredients").font(.title3).fontWeight(.semibold).padding()
                    HStack{
                        VStack{
                            ForEach(viewModel.dessertDetails.ingredients, id: \.self){ ingredient in
                                Text(ingredient )  .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        VStack{
                            ForEach(viewModel.dessertDetails.measurements, id: \.self){ measurement in
                                Text(measurement )  .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                    }
            }
            
            
            .onAppear{
                viewModel.getDessertDetails(idMeal: dessert.idMeal)
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        
    }
}


