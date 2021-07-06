//
//  MainMahvelView.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/28/21.
//

import UIKit
import SnapKit

public enum Section: Int {
    case panels
    case grid
    
    var columnCount: Int {
        switch self {
        case .panels:
            return 2
        case .grid:
            return 3
        }
    }
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
        let layout = createLayout2()
        let mcv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        mcv.backgroundColor = .systemIndigo
        return mcv
    }()
    
    private func createLayout2() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionType = Section(rawValue: sectionIndex) else {
                return nil
            }
            
            let columns = sectionType.columnCount
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let groupWidth = columns == 3 ? NSCollectionLayoutDimension.fractionalWidth(1.0) : NSCollectionLayoutDimension.fractionalWidth(1.0)
            let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: .fractionalHeight(0.225))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
            
        }
        return layout
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let itemSizeSmall = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.35), heightDimension: .fractionalHeight(1.0))
        let itemSizeHalf = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let itemSizeLarge = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.65), heightDimension: .fractionalHeight(1.0))
        let itemSizeSuperLarge = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1.0))
        let itemSizeSuperSmall = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let characterItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.1))
        
        let itemSmall = NSCollectionLayoutItem(layoutSize: itemSizeSmall)
        let itemHalfLeft = NSCollectionLayoutItem(layoutSize: itemSizeHalf)
        let itemHalfRight = NSCollectionLayoutItem(layoutSize: itemSizeHalf)
        let itemLarge = NSCollectionLayoutItem(layoutSize: itemSizeLarge)
        let itemSuperLarge = NSCollectionLayoutItem(layoutSize: itemSizeSuperLarge)
        let itemSuperSmall = NSCollectionLayoutItem(layoutSize: itemSizeSuperSmall)
        let characterItem = NSCollectionLayoutItem(layoutSize: characterItemSize)
        
        
        itemSmall.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
        itemLarge.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
        itemSuperSmall.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        itemSuperLarge.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        itemHalfLeft.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        itemHalfRight.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        characterItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))

        let groupA = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemSmall, itemLarge])
        let groupB = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemHalfLeft, itemHalfRight])
        let groupC = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemSuperSmall, itemSuperLarge])
        let groupD = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: characterItem, count: 9)
        
        groupA.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
        groupB.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        groupC.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0)), subitems: [groupA, groupB, groupC, groupD])
        
        
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
