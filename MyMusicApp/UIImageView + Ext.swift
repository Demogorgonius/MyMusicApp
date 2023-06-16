//
//  UIImageView + Ext.swift
//  MyMusicApp
//
//  Created by Edward on 12.06.2023.
//

import UIKit

extension UIImageView {
    convenience init(imageName: UIImage) {
        self.init(image: imageName)
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}



