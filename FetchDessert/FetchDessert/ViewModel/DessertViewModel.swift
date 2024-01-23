//
//  DessertListViewModel.swift
//  FetchDessert
//
//  Created by Faye Alangi on 11/8/23.
//

import SwiftUI

final class DessertViewModel : ObservableObject {
    
    @Published  var desserts : [Dessert] = []

    
    func getDesserts(){
        
        NetworkManager.shared.getDesserts {result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let desserts):
                    print("\(desserts)")
                    self.desserts = desserts
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
