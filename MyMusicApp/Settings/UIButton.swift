//
//  UIButton.swift
//  MyMusicApp
//
//  Created by Edward on 17.06.2023.
//

import UIKit

extension UIButton {
    
    convenience init(target: Any?, action: Selector) {
        self.init(type: .system)
        self.setImage(AuthConstant.Symbol.seePassword, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        self.addTarget(target, action: action, for: .touchUpInside)
        self.tintColor = .maLightGray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
