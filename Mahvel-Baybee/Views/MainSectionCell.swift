//
//  MainSectionCell.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 6/29/21.
//

import UIKit
import SnapKit

class MainSectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "mainSectionCell"
    
    public lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemYellow
        label.font = UIFont(name: Fonts.badaboom, size: 35)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public lazy var patternView: UIView = {
        let pv = PatternView()
        pv.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.width)
        return pv
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
        setupPatternViewConstraints()
        setupTextLabelConstraints()
    }
    
    private func setupPatternViewConstraints() {
        addSubview(patternView)
        patternView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupTextLabelConstraints() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(self.snp.height).multipliedBy(0.3)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
        }
    }
    
}
