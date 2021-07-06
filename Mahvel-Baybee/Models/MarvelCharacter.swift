//
//  MarvelCharacter.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 7/2/21.
//

import Foundation

struct MarvelCharacter: Decodable {
    let data: CharacterWrapper
}

struct CharacterWrapper: Decodable {
    let results: [Characters]
}

struct Characters: Decodable {
    let name: String
    let thumbnail: ThumbnailWrapper
}

struct ThumbnailWrapper: Decodable {
    let path: String
}
