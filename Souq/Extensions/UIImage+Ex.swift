//
//  UIImage+Ex.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 03/12/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        self.kf.setImage(with: imageURL,
                         placeholder: UIImage(named: "logo"),
                         options: [
                            .loadDiskFileSynchronously,
                            .cacheOriginalImage,
                            .transition(.fade(0.25)),
                         ])
    }
}
