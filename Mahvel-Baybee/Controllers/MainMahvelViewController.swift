//
//  ViewController.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/25/21.
//

import UIKit
import Kingfisher

class MainMahvelViewController: UIViewController {
    
    let mMView = MainMahvelView()
    
    override func loadView() {
        view = mMView
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, String>
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MainMahvelBackground")
        configureCollectionView()
        configureDataSource()
        view.backgroundColor = .systemIndigo
        navigationController?.navigationBar.backgroundColor = .systemBackground
        let allChars = CoreDataManager.shared.fetchAllMarvelCharacters()
        print(allChars.count)
    }
    
    private func configureCollectionView() {
        mMView.cv.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        print("come on first thing")
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: mMView.cv, cellProvider: {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            print("second thing")
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseIdentifier, for: indexPath) as? CharacterCell else {
                print("You fucked up")
                fatalError()
            }
            
//            let allChars = CoreDataManager.shared.fetchAllMarvelCharacters()
//            print(allChars.count)
//            print("Im here kill me")
//            if allChars.count < 1 {
//                for name in CharacterNameList.characterNames {
//                    let urlRequest = "https://gateway.marvel.com:443/v1/public/characters?name=\(name)&ts=15678&apikey=\(SecretKey.publicKey)&hash=\(SecretKey.hash)"
//                    MarvelAPIClient.fetchMarvelCharacter(urlRequest: urlRequest) { (result) in
//                        switch result {
//                        case .failure(let error):
//                            print("failure fetch character with name filter: \(error)")
//                        case .success(let marvelCharacter):
//                            let _ = CoreDataManager.shared.createMarvelCharacter(name: marvelCharacter.data.results[0].name, dateCreated: Date(), img: "\(marvelCharacter.data.results[0].thumbnail.path).jpg", cacheDate: Date(), cacheExpDate: Date())
//                            print(marvelCharacter.data.results[0].name)
//                        }
//                    }
//                }
//            }
            
            
            cell.heroIcon.image = UIImage(systemName: "pencil")
            cell.backgroundColor = .purple
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.grid])
        
        //let allCharacters = CoreDataManager.shared.fetchAllMarvelCharacters()
        snapshot.appendItems(CharacterNameList.characterNames, toSection: .grid)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
}

