//
//  HeaderCollectionReusableView.swift
//  TMS
//
//  Created by Rastsislau Yurevich on 14/06/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    let identifier = "HeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "headerTest"
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    public func configure() {
        backgroundColor = .systemGreen
        addSubview(label)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}
