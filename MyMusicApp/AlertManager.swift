//
//  AlertManager.swift
//  MyMusicApp
//
//  Created by Edward on 12.06.2023.
//

import UIKit

class AlertManager {
    
    static func displayAlert(title: String, message: String, presentingViewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        presentingViewController.present(alert, animated: true)
    }
}
