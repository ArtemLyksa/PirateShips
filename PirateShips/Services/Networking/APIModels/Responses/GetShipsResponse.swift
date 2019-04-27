//
//  GetShipsResponse.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

struct GetShipsResponse: Decodable {
    var ships: [Ship?]
    var success: Bool
}
