//
//  GenericError.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

enum GenericError: Error {
    
    case unknown
    case cannotParseData
    case wrongImageURL(String)
    case generic(Error)
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return "Unknown error. Please, contact support".localized
        case .cannotParseData:
            return "Cannot parse response. Please, contact support".localized
        case .wrongImageURL(let incomingURL):
            return "Cannot create image URL. Incoming URL: \(incomingURL)".localized
        case .generic(let error):
            let nserror = error as NSError
            return nserror.localizedDescription
        }
    }
    
}
