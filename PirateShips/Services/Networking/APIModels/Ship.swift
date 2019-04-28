//
//  File.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

@objcMembers
final class Ship: NSObject {
    var id: Double
    var title: String?
    var details: String
    var price: Double
    var image: String
    var greeting_type: String?
    
    init(id: Double,
         title: String?,
         details: String,
         price: Double,
         image: String,
         greeting_type: String?) {
        
        self.id = id
        self.title = title
        self.details = details
        self.price = price
        self.image = image
        self.greeting_type = greeting_type
    }    
}


extension Ship: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case price = "price"
        case image = "image"
        case greeting_type = "greeting_type"
    }
    
    convenience init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Double.self, forKey: .id)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let description = try container.decode(String.self, forKey: .description)
        let price = try container.decode(Double.self, forKey: .price)
        let image = try container.decode(String.self, forKey: .image)
        let greeting_type = try container.decodeIfPresent(String.self, forKey: .greeting_type)
        
        self.init(id: id,
                  title: title,
                  details: description,
                  price: price,
                  image: image,
                  greeting_type: greeting_type)
    }
}
