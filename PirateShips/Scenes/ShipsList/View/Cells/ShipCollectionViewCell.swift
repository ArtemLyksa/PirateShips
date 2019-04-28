//
//  ShipCollectionViewCell.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

class ShipCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dropShadow()
    }

    func configure(with item: ShipListItem) {
        
        titleLabel.text = item.title
        priceLabel.text = "Price: ".localized + item.price
        
        imageView.image = item.image
        setProgressHud(hidden: !item.isLoading)        
    }
    
    private func setProgressHud(hidden: Bool) {
        
        if hidden {
            isUserInteractionEnabled = true
            activityIndicatorView.stopAnimating()
        } else {
            isUserInteractionEnabled = false
            activityIndicatorView.startAnimating()
        }
    }
    
}
