//
//  DessertCell.swift
//  FetchDessert
//
//  Created by Faye Alangi on 11/7/23.
//

import SwiftUI

struct DessertCell: View {
    
    var dessert : Dessert
    var body: some View {
        HStack(spacing : 30) {
            DessertRemoteImage(urlString: dessert.strMealThumb)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            Text(dessert.strMeal)
                .font(.title2)
                .fontWeight(.medium)
            
        }
    }
}

#Preview {
    DessertCell(dessert: MockDessert.sampleDessert)
}
