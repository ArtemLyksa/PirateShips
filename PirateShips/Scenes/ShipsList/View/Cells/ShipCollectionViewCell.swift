//
//  ShipCollectionViewCell.swift
//  PirateShips
//
//  Created by Artem Lyksa on 4/27/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit
import JGProgressHUD

class ShipCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    private let progressHud = JGProgressHUD(style: .extraLight)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressHud.parallaxMode = .alwaysOff
        progressHud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        progressHud.dismiss()
    }

    func configure(with item: ShipListItem) {
        titleLabel.text = item.title
        priceLabel.text = item.price
        
        setProgressHud(hidden: !item.isLoading)
        
        guard let image = item.image else {
            imageView.image = !item.isLoading ? UIImage(named: "no_image") : nil
            return
        }
        
        imageView.image = image
    }
    
    private func setProgressHud(hidden: Bool) {
        
        if (hidden) {
            progressHud.dismiss()
        } else {
            progressHud.show(in: self)
        }
        
    }
    
}
