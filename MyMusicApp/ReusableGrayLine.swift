//
//  ReusableGrayLine.swift
//  MyMusicApp
//
//  Created by Edward on 12.06.2023.
//

import UIKit

final class ReusableGrayLine: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = CommonConstant.Color.lightGray
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
