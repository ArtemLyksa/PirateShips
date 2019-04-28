//
//  BaseViewModel.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    var isLoading: Observable<Bool> {
        return isLoadingSubject.asObservable()
    }
    var isLoadingSubject = BehaviorSubject(value: false)
    
    //Error handling
    var error: Observable<Error?> {
        return errorSubject.do(onNext: { [weak self] error in
            if error != nil {
                self?.isLoadingSubject.onNext(false)
            }
        }).asObservable()
    }
    var errorSubject = BehaviorSubject<Error?>(value: nil)
    
}

