//
//  ShipListModel.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation
import RxDataSources

struct ShipsListModel: SectionModelType {
    typealias Item = ShipListItem
    
    var items: [Item]
    
    init(original: ShipsListModel, items: [Item]) {
        self = original
        self.items = items
    }
    
    init(ships: [Ship]) {
        self.items = ships.map({ ShipListItem(ship: $0) })
    }
}

struct ShipListItem {
    let title: String
    let price: String
    var image: UIImage?
    
    init(ship: Ship) {
        self.title = ship.title ?? ""
        self.price = "\(ship.price)"
    }
}
