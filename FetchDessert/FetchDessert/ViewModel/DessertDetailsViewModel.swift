//
//  DessertDetailsViewModel.swift
//  FetchDessert
//
//  Created by Faye Alangi on 11/9/23.
//

import SwiftUI

final class DessertDetailsViewModel : ObservableObject {
   
    @Published var dessertDetails : DessertDetails = MockDessertDetails.sampleDessertDetails
    
  
    func getDessertDetails(idMeal : String){
        
        NetworkManager.shared.getDessertById(id: idMeal) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let dessertDetails):
                    print("\(dessertDetails)")
                    self.dessertDetails = dessertDetails[0]
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
