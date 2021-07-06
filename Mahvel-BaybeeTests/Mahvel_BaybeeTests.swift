//
//  Mahvel_BaybeeTests.swift
//  Mahvel-BaybeeTests
//
//  Created by Juan Ceballos on 6/25/21.
//

import XCTest
@testable import Mahvel_Baybee

class Mahvel_BaybeeTests: XCTestCase {
    
    func testNetworkHelperMarvelAPI() {
        let exp = XCTestExpectation(description: "found marvel characters")
        let marvelCharactersEndpoint = "https://gateway.marvel.com:443/v1/public/characters?ts=15678&apikey=\(SecretKey.publicKey)&hash=\(SecretKey.hash)"
        let request = URLRequest(url: URL(string: marvelCharactersEndpoint)!)
        
        NetworkHelper.shared.performDataTask(request: request) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 20_000, "data should be greater than \(data.count)")
            }
        }
        
        wait(for: [exp], timeout: 5.0)
        
    }
    
    func testFetchMarvelCharacter() {
        let exp = XCTestExpectation(description: "found wolverine")
        let urlRequest = "https://gateway.marvel.com:443/v1/public/characters?name=wolverine&ts=15678&apikey=\(SecretKey.publicKey)&hash=\(SecretKey.hash)"
        
        MarvelAPIClient.fetchMarvelCharacter(urlRequest: urlRequest) { (result) in
            switch result {
            case .failure(let error):
                print("\(error)")
                XCTFail("\(error)")
            case .success(let marvelCharacter):
                exp.fulfill()
                XCTAssertEqual(marvelCharacter.data.results.count, 1)
            }
        }
        
        wait(for: [exp], timeout: 5.0)
        
    }
    
}
