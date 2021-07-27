//
//  MainMahvelView.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/28/21.
//

import UIKit
import SnapKit

public enum Section: Int {
    case grid
    
    var columnCount: Int {
        return 3
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
        let layout = createLayout()
        let mcv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        mcv.backgroundColor = .systemIndigo
        return mcv
    }()
    
    private func createLayout() -> UICollectionViewLayout {
        
        let itemWidth = NSCollectionLayoutDimension.fractionalWidth(0.33)
        let itemSize = NSCollectionLayoutSize(widthDimension: itemWidth, heightDimension: itemWidth)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
      
        let section = NSCollectionLayoutSection(group: group)
        
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
