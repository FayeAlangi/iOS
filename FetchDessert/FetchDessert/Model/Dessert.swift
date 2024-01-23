//
//  Dessert.swift
//  FetchDessert
//
//  Created by Faye Alangi on 11/7/23.
//

import Foundation

struct Dessert : Decodable {

    let idMeal : String
    let strMeal : String
    let strMealThumb : String
    
}

struct DessertResponse : Decodable {
    
    let meals : [Dessert]
}

struct MockDessert{
    
    static let sampleDessert = Dessert (idMeal: "001", strMeal:"cake", strMealThumb: "")
    
    static let desserts = [sampleDessert,sampleDessert,sampleDessert]
    
}
