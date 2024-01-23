//
//  NetworkManager.swift
//  FetchDessert
//
//  Created by Faye Alangi on 11/8/23.
//

import UIKit

final class NetworkManager{
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    private let dessertsURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let recipeLookupURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    
    private init() {}
    
    func getDesserts(completed : @escaping (Result<[Dessert],DessertError>)->Void){
        guard let url = URL(string: dessertsURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response,error in
            if let _ = error  {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as?HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invlidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(DessertResponse.self, from: data)
                completed(.success(decodedResponse.meals))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed : @escaping (UIImage?)->Void ){
        //cache images
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        guard let url = URL (string: urlString) else {
            completed(nil)
            return
            
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response,error in
            guard let data = data , let image=UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
            
    }
    
    func getDessertById(id : String , completed : @escaping (Result<[DessertDetails],DessertError>)->Void){
        guard let url = URL(string: recipeLookupURL+id) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response,error in
            if let _ = error  {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as?HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invlidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(DessertDetailsResponse.self, from: data)
                completed(.success(decodedResponse.meals))
                print(decodedResponse.meals[0])
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
