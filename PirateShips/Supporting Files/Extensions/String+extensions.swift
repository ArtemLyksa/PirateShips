//
//  String+extensions.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

@objc extension NSString {
    var localized: NSString {
        let string = self as String
        return NSLocalizedString(string, comment: "") as NSString
    }
}
