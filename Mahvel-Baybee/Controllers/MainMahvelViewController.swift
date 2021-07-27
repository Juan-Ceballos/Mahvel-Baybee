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
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, MarvelCharacterCD>
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MainMahvelBackground")
        view.backgroundColor = .systemIndigo
        navigationController?.navigationBar.backgroundColor = .systemBackground
        configureCollectionView()
        configureDataSource()
        //storeHeroImageURLCD()
        //print(CoreDataManager.shared.fetchAllMarvelCharacters().count)
    }
    
    private func storeHeroImageURLCD() {
        DispatchQueue.main.async {
            for name in PopularMarvelHeroes.characterNames {
                MarvelAPIClient.fetchMarvelCharacter(nameParam: name, urlRequest: "https://gateway.marvel.com:443/v1/public/characters?name=\(name)&ts=15678&apikey=\(SecretKey.publicKey)&hash=\(SecretKey.hash)") { (result) in
                    switch result {
                    case .failure(let appError):
                        print("fetch api key name: \(appError)")
                    case .success(let mv):
                        DispatchQueue.main.async {
                            let _ = CoreDataManager.shared.createMarvelCharacter(name: mv.data.results.first?.name ?? "Gambit", dateCreated: Date(), img: "\(mv.data.results.first?.thumbnail.path ?? "no path").jpg", cacheDate: Date(), cacheExpDate: Date())
                        }
                        
                    }
                }
                
            }
        }
    }
    
    private func configureCollectionView() {
        mMView.cv.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        print("come on first thing")
        dataSource = UICollectionViewDiffableDataSource<Section, MarvelCharacterCD>(collectionView: mMView.cv, cellProvider: {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            print("second thing")
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseIdentifier, for: indexPath) as? CharacterCell else {
                print("You fucked up")
                fatalError()
            }
            
            let url = URL(string: item.img ?? "invalid url path")
            cell.heroIcon.kf.setImage(with: url)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MarvelCharacterCD>()
        snapshot.appendSections([.grid])
        
        let popularCharacters = CoreDataManager.shared.fetchAllMarvelCharacters()
        snapshot.appendItems(popularCharacters, toSection: .grid)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

