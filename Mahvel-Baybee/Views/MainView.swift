//
//  MainView.swift
//  Mahvel-Baybee
//
//  Created by Juan Ceballos on 7/26/21.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    lazy var charactersView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var comicsView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var eventsView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var seriesView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var storiesView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var creatorsView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .fill
        sv.distribution = .fill
        sv.backgroundColor = .systemBackground
        sv.axis = .vertical
        sv.addArrangedSubview(storiesView)
        sv.addArrangedSubview(creatorsView)
        sv.addArrangedSubview(seriesView)
        sv.addArrangedSubview(charactersView)
        sv.addArrangedSubview(eventsView)
        sv.addArrangedSubview(comicsView)
        return sv
    }()
        
    private func commonInit()   {
        setupStackViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(11)
            make.right.equalToSuperview().offset(-11)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            //make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.height.equalToSuperview()
            //make.width.equalToSuperview()
        }
    }
    
}
