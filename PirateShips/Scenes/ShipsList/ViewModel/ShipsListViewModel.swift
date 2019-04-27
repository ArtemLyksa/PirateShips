//
//  ShipsListViewModel.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ShipsListViewModel: BaseViewModel {
    
    var shipsListModelObservable: Observable<[ShipsListModel]> {
        return shipsListRelay.map({ [ShipsListModel(ships: $0)] })
    }
    
    private let networkService: NetworkService
    private let shipsListRelay = BehaviorRelay<[Ship]>(value: [])
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        super.init()
        getShips()
    }
    
    private func getShips() {
        isLoadingSubject.onNext(true)
        
        networkService.getShips().subscribe(onNext: { [weak self] ships in
            self?.isLoadingSubject.onNext(false)
            self?.shipsListRelay.accept(ships)
        }, onError: { [weak self]  error in
            self?.errorSubject.onNext(error)
        }).disposed(by: disposeBag)
    }
}
