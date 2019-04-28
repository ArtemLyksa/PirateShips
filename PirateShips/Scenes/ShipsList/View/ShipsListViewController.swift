//
//  ShipsListViewController.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import RxCocoa
import RxSwift
import RxDataSources

class ShipsListViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: ShipsListViewModel!
    private var dataSource: RxCollectionViewSectionedAnimatedDataSource<ShipsListModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsOnLoad()
        setupObservables()        
    }
    
    private func setupViewsOnLoad() {
        navigationItem.title = "Ships list".localized;
    }
    
    private func setupObservables() {
        
        dataSource = RxCollectionViewSectionedAnimatedDataSource<ShipsListModel>(
            configureCell: { _, collectionView, indexPath, item in
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
        
        collectionView.rx.itemSelected
            .map({ $0.row})
            .bind(to: viewModel.selectedIndex)
            .disposed(by: disposeBag)
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = viewModel
        }
    }
}


