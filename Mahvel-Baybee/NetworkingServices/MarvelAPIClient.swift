//
//  MarvelAPIClient.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/28/21.
//

import Foundation

class MarvelAPIClient {
    let baseURL = "https://gateway.marvel.com:443/v1/public/"
    public static func fetchMarvelCharacter(nameParam: String, urlRequest: String, completion: @escaping (Result<MarvelCharacter, AppError>) -> ()) {
        
        guard let url = URL(string: urlRequest) else {
            completion(.failure(.badURL(urlRequest)))
            return
        }
        
        let urlRequest = URLRequest(url: url)
                
        NetworkHelper.shared.performDataTask(request: urlRequest) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let characters = try JSONDecoder().decode(MarvelCharacter.self, from: data)
                    completion(.success(characters))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
