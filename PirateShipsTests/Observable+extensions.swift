//
//  Observable+extensions.swift
//  PirateShipsTests
//
//  Created by Artem Lyksa on 4/29/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift
import RxBlocking
import Nimble

extension Observable {
    typealias TestResponse = (object: Element?, error: Error?)
    
    @discardableResult
    func executeAndHandleError(_ functionName: String = #function) -> Element? {
        let response = self.response
        
        if let error = response?.error {
            fail("Caught an error in \(functionName) \n \(error.localizedDescription)")
        }
        
        return response?.object
    }
    
    var response: TestResponse? {
        
        var result: TestResponse = (nil, nil)
        do {
            result.object = try toBlocking(timeout: 60).first()
        } catch {
            result.error = error
        }
        return result
    }
    
}
