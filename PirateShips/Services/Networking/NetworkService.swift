//
//  NetworkService.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift
import Alamofire

protocol NetworkProtocol {
    
    func getShips() -> RequestResult
}


@objc class NetworkService: NSObject {
    
    private let requestRealizer: NetworkProtocol
    private let disposeBag = DisposeBag()
    
    private let scheduler = ConcurrentDispatchQueueScheduler(qos: .background)
    
    init(requestRealizer: NetworkProtocol) {
        self.requestRealizer = requestRealizer
    }
    
    func getShips() -> Observable<[Ship]> {
        return requestRealizer.getShips()
            .subscribeOn(scheduler)
            .toResult(type: GetShipsResponse.self)
            .map({ $0.ships.compactMap({ $0 }) })
    }
}

private extension Observable where Element == Data {
    
    func toResult<T: Decodable>(type: T.Type) -> Observable<T> {
        return map({
            try self.handleRequestResult(type: type, data: $0)
        })
    }
    
    private func handleRequestResult<T: Decodable>(type: T.Type, data: Data?) throws -> T {
        guard let data = data else {
            throw GenericError.cannotParseData
        }
        
        do {
            let response = try JSONDecoder().decode(type, from: data)
            return response
        } catch (let error ) {
            let nserror = error as NSError
            print("Error occurred when trying to parse \(type): \n ***\(nserror.userInfo)***")
            throw GenericError.generic(error)
        }
    }
}
