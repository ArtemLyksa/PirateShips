//
//  BaseViewController.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    func setupBaseObservables(_ baseViewModel: BaseViewModel) {
        
        setupSpinner(drivenBy: baseViewModel.isLoadingSubject)
        
        baseViewModel.error
            .flatMap({ Observable.from(optional: $0) })
            .bind(to: rx.errorAlert)
            .disposed(by: disposeBag)
    }
}
