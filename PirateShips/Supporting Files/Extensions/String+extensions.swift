//
//  String+extensions.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func height(for width: CGFloat, and font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}

@objc extension NSString {
    var localized: NSString {
        let string = self as String
        return NSLocalizedString(string, comment: "") as NSString
    }
}
