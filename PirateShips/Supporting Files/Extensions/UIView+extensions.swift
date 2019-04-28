//
//  UIView+extensions.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

extension UIView {
    
    @objc func dropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero
    }
    
}
