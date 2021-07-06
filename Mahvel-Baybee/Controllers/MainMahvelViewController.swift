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
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MainMahvelBackground")
        configureDataSource()
        configureCollectionView()
        view.backgroundColor = .systemIndigo
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }
    
    private func configureCollectionView() {
        mMView.cv.register(MainSectionCell.self, forCellWithReuseIdentifier: MainSectionCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: mMView.cv, cellProvider: {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainSectionCell.reuseIdentifier, for: indexPath) as? MainSectionCell else {
                fatalError()
            }
            cell.textLabel.text = item
//            DispatchQueue.main.async {
//                MarvelAPIClient.fetchMarvelCharacter(urlRequest: "https://gateway.marvel.com:443/v1/public/characters?name=wolverine&ts=15678&apikey=\(SecretKey.publicKey)&hash=\(SecretKey.hash)") { (result) in
//                    switch result {
//                    case .failure(let error):
//                        print(error)
//                    case .success(let mvc):
//                        let url = URL(string: "\(mvc.data.results.first?.thumbnail.path ?? "").jpg")
//                        DispatchQueue.main.async {
//                            cell.heroIcon.kf.setImage(with: url)
//                        }
//                    }
//                }
//            }
            
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.panels, .grid])
        snapshot.appendItems(["Comics", "Shows", "Events", "Movies", "Merchandise", "Games"], toSection: .panels)
        
        snapshot.appendItems(["One", "Two", "Three"], toSection: .grid)
        dataSource.apply(snapshot, animatingDifferences: false)
    }


}

