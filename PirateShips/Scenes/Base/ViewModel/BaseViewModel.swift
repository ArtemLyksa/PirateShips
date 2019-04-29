//
//  BaseViewModel.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift

class BaseViewModel {
    
    let isLoadingSubject = BehaviorSubject(value: false)
    let errorSubject = BehaviorSubject<Error?>(value: nil)
    let disposeBag = DisposeBag()
    
    //Spinner 
    var isLoading: Observable<Bool> {
        return isLoadingSubject.asObservable()
    }
    
    //Error handling
    var error: Observable<Error?> {
        return errorSubject.do(onNext: { [weak self] error in
            if error != nil {
                self?.isLoadingSubject.onNext(false)
            }
        }).asObservable()
    }
}

