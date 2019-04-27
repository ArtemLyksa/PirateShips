//
//  ShipsListCoordinator.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

class ShipsListCoordinator: Coordinator {
    
    let presenter: UINavigationController
    let viewController: UIViewController
    
    init(presenter: UINavigationController, networkService: NetworkService) {
        self.presenter = presenter
        viewController = BaseViewController()
    }
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
}
