//
//  URLRouter.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation
import Alamofire

enum URLRouter: URLRequestConvertible {
    
    private static let baseUrl = URL(string: "https://assets.shpock.com/mobile/interview-test/pirateships")!
    
    case getShips
    
    func asURLRequest() throws -> URLRequest {
        
        var httpMethod: HTTPMethod {
            switch self {
            case .getShips:
                return .get
            }
        }
        
        var url: URL {
            switch self {
            case .getShips:
                return URLRouter.baseUrl
            }
        }
        
        var params: Parameters? {
            switch self {
            case .getShips:
                return nil
            }
        }
        
        let encoding = URLEncoding.queryString
        let request = try URLRequest(url: url, method: httpMethod)
        
        return try encoding.encode(request, with: params)
    }
}
