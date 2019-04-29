//
//  FileService.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

struct FileService {
    
    static func saveImage(image: UIImage, for name: String) {
        guard
            let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return
        }
        
        do {
            let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            try data.write(to: directory.appendingPathComponent(name))
            return
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    static func getSavedImage(named: String) -> UIImage? {
        
        do {
            let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            return UIImage(contentsOfFile: URL(fileURLWithPath: directory.absoluteString).appendingPathComponent(named).path)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func removeSavedImage(named: String) {
        
        do {
            let directory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            try FileManager.default.removeItem(at: directory)
        } catch {
            print(error.localizedDescription)
        }
    }
}
