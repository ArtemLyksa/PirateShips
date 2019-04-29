//
//  NetworkServiceTests.swift
//  NetworkServiceTests
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import XCTest
import Nimble

@testable import PirateShips

class NetworkServiceTests: XCTestCase {

    private var networkService: NetworkService!
    private let imgUrl = "http://images.bit-tech.net/content_images/2008/01/pirates_of_the_burning_sea/p.jpg"
    
    override func setUp() {
        networkService = NetworkService(requestRealizer: RequestRealizer())
    }

    func testGetShips() {
        
        guard let ships = networkService.getShips().executeAndHandleError() else {
            fail("Ships are nil")
            return
        }
        
        expect(ships).toNot(beEmpty())
    }
    
    func testGetImage() {
        
        guard let url = URL(string: imgUrl) else {
            fail("URL is wrong")
            return
        }
        
        guard let image = networkService.getImage(url: url).executeAndHandleError() else {
            fail("GetImageResponse is nil")
            return
        }
        
        expect(image).toNot(beNil())
    }

}
