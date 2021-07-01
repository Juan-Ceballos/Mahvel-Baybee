//
//  ViewController.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/25/21.
//

import UIKit

class MainMahvelViewController: UIViewController {

    let mMView = MainMahvelView()
    
    override func loadView() {
        view = mMView
        let patternView = PatternView()
        patternView.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
        view.addSubview(patternView)
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MainMahvelBackground")
        configureDataSource()
        configureCollectionView()
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
            cell.textLabel.text = "MAHVEL"
            cell.backgroundColor = .blue
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.comics])
        snapshot.appendItems(["Comics", "Movies", "Shows", "Games", "Events", "Merchandise"])
        dataSource.apply(snapshot, animatingDifferences: false)
    }


}

