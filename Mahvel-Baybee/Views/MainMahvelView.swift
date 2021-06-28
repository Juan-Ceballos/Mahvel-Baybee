//
//  MainMahvelView.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/28/21.
//

import UIKit
import SnapKit

class MainMahvelView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
//    private lazy var cv = UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//        return layout
//    }
    
//    private func layout() -> UICollectionViewFlowLayout {
//        
//    }
    
    
    
    private func commonInit()   {
        setupMainMahvelCV()
    }
    
    private func setupMainMahvelCV() {
        
    }
    
}
