//
//  AppError.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/28/21.
//

import Foundation

public enum AppError: Error {
    case badURL(String)
    case networkClientError(Error)
    case decodingError(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
}
