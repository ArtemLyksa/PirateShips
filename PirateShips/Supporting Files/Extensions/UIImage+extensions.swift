//
//  UIImage+extensions.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit


enum ImageName: String {
    case no_image = "no_image"
}

extension UIImage {
    
    convenience init?(named name: ImageName) {
        self.init(named: name.rawValue)
    }
}

