//
//  DessertListView.swift
//  FetchDessert
//
//  Created by Faye Alangi on 11/7/23.
//

import SwiftUI

struct DessertListView: View {
    @StateObject var viewModel = DessertViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.desserts.sorted{ $0.strMeal < $1.strMeal }, id: \.idMeal){dessert in
                
                NavigationLink(destination: DessertDetailView(dessert: dessert)){
                    DessertCell(dessert: dessert)
                }.navigationTitle("🧁 Desserts")
                    .navigationViewStyle(StackNavigationViewStyle())
            }
        }
        .onAppear{
            viewModel.getDesserts()
            
        }
    }
    

}

#Preview {
    DessertListView()
}
