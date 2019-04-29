//
//  FileServiceTests.swift
//  PirateShipsTests
//
//  Created by Artem Lyksa on 4/29/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import XCTest
import Nimble

@testable import PirateShips

class FileServiceTests: XCTestCase {
    
    private let imageName = ImageName.no_image
    
    func testSaveImage() {
        
        let image = UIImage(named: imageName)!
        FileService.saveImage(image: image, for: imageName.rawValue)
        
        //Check if image was saved
        var savedImage = FileService.getSavedImage(named: imageName.rawValue)
        expect(savedImage).toNot(beNil())
        
        FileService.removeSavedImage(named: imageName.rawValue)
        
        //Check if image was deleted
        savedImage = FileService.getSavedImage(named: imageName.rawValue)
        expect(savedImage).to(beNil())
    }
    
}
