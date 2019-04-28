//
//  ShipDetailsCoordinator.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

@objc protocol ShipDetailsCoordinatorDelegate {
    @objc func displayGreeting(_ greeting: String)
}

class ShipDetailsCoordinator: Coordinator {
    
    let presenter: UINavigationController
    let viewController: ShipDetailsViewController
    
    init(presenter: UINavigationController, ship: Ship, shipImage: UIImage) {
        self.presenter = presenter
        viewController = ShipDetailsViewController.instantiate() as! ShipDetailsViewController
        let viewModel = ShipDetailsViewModel(ship: ship, image: shipImage)
        viewController.viewModel = viewModel
        
        viewModel.delegate = self
    }
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
    
}

extension ShipDetailsCoordinator: ShipDetailsCoordinatorDelegate {
    
    func displayGreeting(_ greeting: String) {
        let alert = UIAlertController(title: greeting, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized, style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
