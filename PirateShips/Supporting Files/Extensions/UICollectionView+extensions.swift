//
//  UICollectionView+extensions.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func getCell<T>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        
        let nibName = "\(type)"
        
        register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        return dequeueReusableCell(withReuseIdentifier: nibName, for: indexPath) as! T
    }
}

