//
//  MarvelAPIClient.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/28/21.
//

import Foundation

class MarvelAPIClient {
    let baseURL = "https://gateway.marvel.com:443/v1/public/"
    public static func fetchMarvelCharacter(urlRequest: String, completion: @escaping (Result<MarvelCharacter, AppError>) -> ()) {
        
        let urlEndpoint = "https://gateway.marvel.com:443/v1/public/characters?name=wolverine&ts=15678&apikey=\(SecretKey.publicKey)&hash=\(SecretKey.hash)"
        
        guard let url = URL(string: urlEndpoint) else {
            completion(.failure(.badURL(urlEndpoint)))
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
