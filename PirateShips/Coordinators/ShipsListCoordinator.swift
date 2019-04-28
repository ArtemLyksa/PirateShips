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
        
        let viewModel = ShipsListViewModel(networkService: networkService)
        viewController.viewModel = viewModel
        viewController.setupBaseObservables(viewModel)
    }
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
}
