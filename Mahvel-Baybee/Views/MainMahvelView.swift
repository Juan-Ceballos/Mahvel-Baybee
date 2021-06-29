//
//  MainMahvelView.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/28/21.
//

import UIKit
import SnapKit

public enum Section {
    case games
    case shows
    case events
    case movies
    case comics
    case merchandise
}

class MainMahvelView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public lazy var cv: UICollectionView = {
        let layout = createLayout()
        let mcv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        mcv.backgroundColor = UIColor(named: "MainMahvelBackground")
        return mcv
    }()
    
    private func createLayout() -> UICollectionViewLayout {
        
        let itemSizeSmall = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .fractionalHeight(1.0))
        let itemSizeHalf = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let itemSizeLarge = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.65), heightDimension: .fractionalHeight(1.0))
        let itemSizeSuperLarge = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1.0))
        let itemSizeSuperSmall = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        
        let itemSmall = NSCollectionLayoutItem(layoutSize: itemSizeSmall)
        let itemHalfLeft = NSCollectionLayoutItem(layoutSize: itemSizeHalf)
        let itemHalfRight = NSCollectionLayoutItem(layoutSize: itemSizeHalf)
        let itemLarge = NSCollectionLayoutItem(layoutSize: itemSizeLarge)
        let itemSuperLarge = NSCollectionLayoutItem(layoutSize: itemSizeSuperLarge)
        let itemSuperSmall = NSCollectionLayoutItem(layoutSize: itemSizeSuperSmall)
        
        itemSmall.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
        itemLarge.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
        itemSuperSmall.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
        itemSuperLarge.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
        itemHalfLeft.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
        itemHalfRight.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))

        let groupA = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemSmall, itemLarge])
        let groupB = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemHalfLeft, itemHalfRight])
        let groupC = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemSuperSmall, itemSuperLarge])
        
        groupA.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        groupB.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        groupC.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(16/9)), subitems: [groupA, groupB, groupC])
        
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    
    
    private func commonInit()   {
        setupMainMahvelCV()
    }
    
    private func setupMainMahvelCV() {
        addSubview(cv)
        cv.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
}
