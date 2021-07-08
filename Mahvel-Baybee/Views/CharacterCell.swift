//
//  CharacterCell.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 7/7/21.
//

import UIKit
import SnapKit

class CharacterCell: UICollectionViewCell {
    static let reuseIdentifier = "characterSectionCell"
    
    override func layoutSubviews() {
        heroIcon.makeRoundedIV()
    }
    
    public lazy var heroIcon: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.width))
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .red
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHeroIconConstraints()
    }
    
    private func setupHeroIconConstraints() {
        addSubview(heroIcon)
        heroIcon.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(self.snp.width)
            make.width.equalTo(self.snp.width)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}
