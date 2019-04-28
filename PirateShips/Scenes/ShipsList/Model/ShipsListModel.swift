//
//  ShipListModel.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation
import RxDataSources

struct ShipsListModel: AnimatableSectionModelType {
    typealias Item = ShipListItem
    
    var items: [Item]
    
    var identity: String {
        return "ShipsListModel"
    }
    
    init(original: ShipsListModel, items: [Item]) {
        self = original
        self.items = items
    }
    
    init(ships: [Ship]) {
        self.items = ships.map({ ShipListItem(ship: $0) })
    }
}

struct ShipListItem: IdentifiableType, Equatable {
    
    let id: Double
    let title: String
    let price: String
    var image: UIImage?
    var isLoading: Bool
    
    var identity: String {
        return "\(id)"
    }
    
    init(ship: Ship, image: UIImage? = nil, isLoading: Bool = true) {
        self.id = ship.id
        self.title = ship.title ?? "No title".localized
        self.price = "\(ship.price)"
        self.image = image
        self.isLoading = isLoading
    }
    
}
