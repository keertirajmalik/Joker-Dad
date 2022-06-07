//
//  JokeVCExtension.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 07/06/22.
//

import UIKit

extension UIViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "No internet", message: "connect to internet to get more dad jokes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
}

