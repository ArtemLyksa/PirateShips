//
//  BaseViewController+extensions.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxSwift
import RxCocoa

extension BaseViewController {
    
    private var animationDuration: Double {
        return 0.35
    }
    
    private var overlayViewAlpha: CGFloat {
        return 0.4
    }
    
    func setupSpinner(drivenBy observable: Observable<Bool>) {
        
        let overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(overlayViewAlpha)
        overlayView.isHidden = true
        view.addSubview(overlayView)
        
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = UIColor.black
        overlayView.addSubview(activityIndicatorView)
        
        observable.distinctUntilChanged().observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isBusy in
                
                guard let strongSelf = self else { return }
                
                if isBusy {
                    activityIndicatorView.frame = strongSelf.view.bounds
                    strongSelf.view.isUserInteractionEnabled = false
                    strongSelf.view.bringSubviewToFront(overlayView)
                    strongSelf.easeViewIn(overlayView)
                    
                    activityIndicatorView.isHidden = false
                    activityIndicatorView.startAnimating()
                } else {
                    strongSelf.view.isUserInteractionEnabled = true
                    activityIndicatorView.stopAnimating()
                    strongSelf.easeViewOut(overlayView)
                }
                
                }, onDisposed: { [weak self] in
                    
                    guard let strongSelf = self else { return }
                    
                    strongSelf.view.isUserInteractionEnabled = true
                    activityIndicatorView.stopAnimating()
                    strongSelf.easeViewOut(overlayView)
                    
            }).disposed(by: disposeBag)
    }
    
    private func easeViewIn(_ view: UIView) {
        view.isHidden = false
        view.layer.removeAllAnimations()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: [UIView.AnimationOptions.beginFromCurrentState, UIView.AnimationOptions.curveEaseOut], animations: {
            view.alpha = 1.0
        }, completion: nil)
    }
    
    private func easeViewOut(_ view: UIView) {
        view.layer.removeAllAnimations()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: [UIView.AnimationOptions.beginFromCurrentState, UIView.AnimationOptions.curveEaseIn], animations: {
            view.alpha = 0.0
        }, completion: { completed in
            if completed {
                view.isHidden = true
            }
        })
    }
}

extension Reactive where Base: BaseViewController {
    
    var errorAlert: Binder<Error> {
        return Binder(self.base) { viewController, error in
            let alert = UIAlertController(title: "Error".localized,
                                          message: error.localizedDescription,
                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok".localized, style: .default, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            
            alert.addAction(action)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
