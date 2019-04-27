//
//  ShipsListViewController.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class ShipsListViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: RxCollectionViewSectionedReloadDataSource<ShipsListModel>?
    
    var viewModel: ShipsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservables()
    }
    
    private func setupObservables() {
        
        dataSource = RxCollectionViewSectionedReloadDataSource<ShipsListModel>(
            configureCell: { dataSource, collectionView, indexPath, item in
                let cell = collectionView.getCell(ofType: ShipCollectionViewCell.self, for: indexPath)
                cell.configure(with: item)
                return cell
        })
        
        viewModel.shipsListModelObservable
            .bind(to: collectionView.rx.items(dataSource: dataSource!))
            .disposed(by: disposeBag)
        
        collectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
}


extension ShipsListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = collectionView.frame.width
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            width -= flowLayout.minimumLineSpacing
        }
        
        return CGSize(width: width, height: collectionView.frame.height)
    }
}
