//
//  CategoryViewController.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.setupUI()
        self.bindData()
        self.setCollectionView()
        self.viewModel.viewDidLoad()
    }
    
    func bindData() {
        self.viewModel.didCategoryFetch = { [weak self] in
            guard let self = self else { return }
            
            self.loaderView.stopAnimating()
            self.loaderView.isHidden = true
            self.collectionView.reloadData()
        }
        
        self.viewModel.didSelectCategory = { [weak self] index in
            let subCatogryViewController = SubCatogryViewController()
            subCatogryViewController.productCategoryId = index
            self?.navigationController?.pushViewController(subCatogryViewController, animated: true)
        }
        
        self.viewModel.didNoHasChild = { [weak self] in
            let alert = UIAlertController(title: "Alert".localize, message: "No Child".localize, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok".localize, style: .cancel)
            alert.addAction(alertAction)
            self?.present(alert, animated: true)
        }
    }
    
    func setupUI() {
        self.loaderView.startAnimating()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
