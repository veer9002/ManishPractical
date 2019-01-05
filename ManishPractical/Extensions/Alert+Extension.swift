//
//  Alert+Extension.swift
//  ManishPractical
//
//  Created by Syon on 03/01/19.
//  Copyright © 2019 Syon. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
