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
    let viewController: ShipsListViewController
    
    init(presenter: UINavigationController, networkService: NetworkService) {
        self.presenter = presenter
        viewController = ShipsListViewController.instantiate() as! ShipsListViewController
        
        viewController.viewModel = ShipsListViewModel(networkService: networkService)
    }
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
}
