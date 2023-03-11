//
//  CategoryCollectionViewCell.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import UIKit

protocol CategoryCellViewModel {
    func loadImage(url: String)
    func setTitle(title: String)
}

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setView()
    }
    
    func setView() {
        self.lblTitle.textColor = DesignSystem.Colors.white.color
        self.lblTitle.font = DesignSystem.TypoGraphy.subTitle.font
    }
}

extension CategoryCollectionViewCell: CategoryCellViewModel {
    func loadImage(url: String) {
        self.imageView.loadImage(url: url)
    }
    
    func setTitle(title: String) {
        self.lblTitle.text = title
    }
}
