//
//  MainCoordinator.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift

struct MainCoordinator: Coordinator {
    
    private let rootViewController: UINavigationController
    private let networkService = NetworkService(requestRealizer: RequestRealizer())
    
    private let window: UIWindow?
    private let shipsListCoordinator: ShipsListCoordinator
    
    init(window: UIWindow?) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.shipsListCoordinator = ShipsListCoordinator(presenter: rootViewController, networkService: networkService)
    }
    
    func start() {
        guard let window = window else {
            return
        }
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        shipsListCoordinator.start()
    }
}
