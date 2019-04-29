//
//  ShipsListCoordinator.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift

class ShipsListCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private let viewController: ShipsListViewController
    
    private let disposeBag = DisposeBag()
    private var shipDetailsCoordinator: ShipDetailsCoordinator?
    
    init(presenter: UINavigationController, networkService: NetworkService) {
        self.presenter = presenter
        viewController = ShipsListViewController.instantiate() as! ShipsListViewController
        
        let viewModel = ShipsListViewModel(networkService: networkService)
        viewController.viewModel = viewModel
        viewController.setupBaseObservables(viewModel)
        
        //Handle selected cell
        viewModel.selectedShipObservable.subscribe(onNext: { [weak self] ship, image in
            self?.shipDetailsCoordinator = ShipDetailsCoordinator(presenter: presenter, ship: ship, shipImage: image!)
            self?.shipDetailsCoordinator?.start()
        }).disposed(by: disposeBag)
    }
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
}
