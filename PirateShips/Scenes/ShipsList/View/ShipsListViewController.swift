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
    private var dataSource: RxCollectionViewSectionedAnimatedDataSource<ShipsListModel>?
    
    var viewModel: ShipsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservables()
    }
    
    private func setupObservables() {
        
        dataSource = RxCollectionViewSectionedAnimatedDataSource<ShipsListModel>(
            configureCell: { dataSource, collectionView, indexPath, item in
                let cell = collectionView.getCell(ofType: ShipCollectionViewCell.self, for: indexPath)
                cell.configure(with: item)
                return cell
        })
        
        viewModel.shipsListModelObservable
            .bind(to: collectionView.rx.items(dataSource: dataSource!))
            .disposed(by: disposeBag)
        
        
        collectionView.rx.willDisplayCell
            .map({ $1.row })
            .bind(to: viewModel.displayedIndex)
            .disposed(by: disposeBag)
        
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = viewModel
        }
    }
}


