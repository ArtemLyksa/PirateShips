//
//  UIViewController+extensions.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private enum Storyboard: String {
        case main
        
        var instance: UIStoryboard {
            switch self {
            case .main:
                return UIStoryboard(name: "Main", bundle: nil)
            }
        }
    }
    
    static func instantiate() -> UIViewController {
        let id = String(describing: self)
        return Storyboard.main.instance.instantiateViewController(withIdentifier: id)
    }
    
}

