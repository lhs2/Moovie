//
//  Coordinators.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 03/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var child: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

protocol Storyboarded {
    static func instantiate(_ name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ name: String = "Home") -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

class SDCoordinator: Coordinator {
    
    var child = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeController.instantiate()
        vc.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    func backToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
}
