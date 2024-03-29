//
//  CustomLabel.swift
//  MyMusicApp
//
//  Created by Edward on 16.06.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    func createCustomLabel(text: String,
                           textColor: UIColor,
                           font: UIFont,
                           textAlignment: NSTextAlignment,
                           numberOfLines: Int) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}
