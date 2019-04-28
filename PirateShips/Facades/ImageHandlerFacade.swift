//
//  ImageHandlerFacade.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift

class ImageHandlerFacade {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getImage(path: String) -> Observable<UIImage?> {
        
        guard let imgName = path.components(separatedBy: "/").last else {
            return Observable.error(GenericError.wrongImageURL(path))
        }
        
        //Check if an image exists in the filesystem
        if let image = FileService.getSavedImage(named: imgName) {
            return Observable.just(image)
        }
        
        guard let url = URL(string: path) else {
            return Observable.error(GenericError.wrongImageURL(path))
        }
        
        return networkService.getImage(url: url).do(onNext: { image in
            //Save image
             if let image = image {
                FileService.saveImage(image: image, for: imgName)
            }
        })
    }
    
}
