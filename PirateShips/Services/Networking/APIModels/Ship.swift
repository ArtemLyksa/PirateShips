//
//  File.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

struct Ship: Decodable {
    var id: Double
    var title: String?
    var description: String?
    var price: Int
    var image: String
    var greeting_type: String?
}
