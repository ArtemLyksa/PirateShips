//
//  ShipsListViewModel.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ShipsListViewModel: BaseViewModel {
    
    var shipsListModelObservable: Observable<[ShipsListModel]> {
        return shipsListModelRelay.asObservable()
    }

    let displayedIndex = PublishSubject<Int>()
    
    private let networkService: NetworkService
    private let imageHandler: ImageHandlerFacade
    
    private let shipsListModelRelay = BehaviorRelay<[ShipsListModel]>(value: [])
    private let shipsListRelay = BehaviorRelay<[Ship]>(value: [])
    
    init(networkService: NetworkService) {
        
        self.networkService = networkService
        self.imageHandler = ImageHandlerFacade(networkService: networkService)
        
        super.init()
        
        setupBindings()
        getShips()
    }
    
    private func setupBindings() {
        
        shipsListRelay.map({ [ShipsListModel(ships: $0)] })
            .bind(to: shipsListModelRelay)
            .disposed(by: disposeBag)
        
        displayedIndex.asObservable()
            .subscribe(onNext: { [weak self] index in
                self?.getImageForShip(at: index)
            }).disposed(by: disposeBag)
    }
    
    private func getShips() {
        
        isLoadingSubject.onNext(true)
        
        networkService.getShips()
            .delay(15.0, scheduler: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] ships in
                self?.isLoadingSubject.onNext(false)
                self?.shipsListRelay.accept(ships)
            }, onError: { [weak self]  error in
                self?.errorSubject.onNext(error)
            }).disposed(by: disposeBag)
    }
    
    private func getImageForShip(at index: Int) {
        
        guard let displayedListModel = shipsListModelRelay.value.first,
            displayedListModel.items[index].image == nil
            else {
                return
        }
        
        let ship = shipsListRelay.value[index]
        
        imageHandler.getImage(path: ship.image).subscribe(onNext: { [weak self]  image in
            self?.handle(image: image, at: index)
        }, onError: { [weak self] error in
            self?.errorSubject.onNext(error)
        }).disposed(by: disposeBag)
    }
    
    private func handle(image: UIImage?, at index: Int) {
        
        guard let displayedListModel = shipsListModelRelay.value.first else {
            return
        }
        
        let ship = shipsListRelay.value[index]
        
        var displayedItems = displayedListModel.items
        
        let image = image ?? UIImage(named: .no_image)
        displayedItems[index] = ShipListItem(ship: ship, image: image, isLoading: false)
        shipsListModelRelay.accept([ShipsListModel(original: displayedListModel, items: displayedItems)])
    }
    
}

extension ShipsListViewModel: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        heightFor indexPath: IndexPath,
                        for width: CGFloat) -> CGFloat {
        
        guard let shipItem = shipsListModelRelay.value.first?.items[indexPath.row] else {
            return 0.0
        }
        let font = UIFont.systemFont(ofSize: 17.0)
        
        return shipItem.title.height(for: width, and: font) +
            shipItem.price.height(for: width, and: font) +
        160.0
    }
}
