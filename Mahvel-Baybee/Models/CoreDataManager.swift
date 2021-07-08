//
//  CoreDataManager.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 7/8/21.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    private var marvelCharacters = [MarvelCharacterCD]()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public func createMarvelCharacter(name: String, dateCreated: Date, img: String, cacheDate: Date, cacheExpDate: Date) -> MarvelCharacterCD {
        
        let marvelCharacter = MarvelCharacterCD(entity: MarvelCharacterCD.entity(), insertInto: context)
        marvelCharacter.name = name
        marvelCharacter.cacheDate = cacheDate
        marvelCharacter.dateCreated = dateCreated
        marvelCharacter.cacheExpDate = dateCreated
        marvelCharacter.img = img
        
        do {
            try context.save()
        } catch {
            print("could create and save mv character: \(error)")
        }
        
        return marvelCharacter
    }
    
    public func fetchAllMarvelCharacters() -> [MarvelCharacterCD] {
        let fetchRequest = NSFetchRequest<MarvelCharacterCD>(entityName: "MarvelCharacterCD")
        do {
            marvelCharacters = try context.fetch(fetchRequest)
        } catch {
            print("failed to retrieve all marvel characters in cd: \(error)")
        }
        
        return marvelCharacters
    }
    
}
