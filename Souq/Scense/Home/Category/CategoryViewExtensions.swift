//
//  CategoryViewExtensions.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation
import UIKit

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.registerCells()
    }
    
    func registerCells() {
        self.collectionView.registerCell(cell: CategoryCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCatrgory
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(indexPath: indexPath) as CategoryCollectionViewCell
        self.viewModel.configCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.didSelectCell(indexPath: indexPath)
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: collectionView.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
}
