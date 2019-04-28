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
        .subscribe(onNext: { [weak self] _, indexPath in
            self?.viewModel.displayedIndex = indexPath.row
        }).disposed(by: disposeBag)
        
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
}

extension ShipsListViewController: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        heightFor indexPath: IndexPath,
                        for width: CGFloat) -> CGFloat {
        
        let shipItem = viewModel.shipsListModelRelay.value.first?.items[indexPath.row]
        let font = UIFont.systemFont(ofSize: 17.0)
        
        return shipItem!.title.height(for: width, font: font) +
               shipItem!.price.height(for: width, font: font) +
               160.0
    }
}

