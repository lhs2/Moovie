//
//  UIViewController.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(title:String, error:String, buttonTexts: [String], completion: ((Int) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
        for (index, text) in buttonTexts.enumerated() {
            alert.addAction(UIAlertAction(title: text, style: .default, handler: { action in
                print(index)
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }

}
