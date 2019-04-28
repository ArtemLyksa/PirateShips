//
//  RequestRealizer.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift
import RxAlamofire

typealias RequestResult = Observable<Data>

struct RequestRealizer: NetworkProtocol {
    
    func getShips() -> RequestResult {
        return performRequest(with: .getShips)
    }
    
    func getImage(url: URL) -> RequestResult {
        return performRequest(with: .getImage(url: url))
    }
    
    private func performRequest(with route: URLRouter) -> RequestResult {
        return RxAlamofire.requestData(route).map({ $0.1 })
    }
    
}

