//
//  SubCatogryViewController.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import UIKit

class SubCatogryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    @IBOutlet weak var backButton: UIButton!
    
    var productCategoryId: Int?
    let viewModel = SubCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    @IBAction func didTappedBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SubCatogryViewController {
    func setup() {
        self.setupUI()
        self.bindData()
        self.setCollectionView()
        self.viewModel.viewDidLoad(index: productCategoryId ?? -1)
    }
    
    fileprivate func setupUI() {
        self.lblTitle.text = "Moters".localize
        self.lblTitle.textColor = DesignSystem.Colors.white.color
        self.lblTitle.font = DesignSystem.TypoGraphy.title.font
        self.backButton.setImage("lang".localize == "en" ? UIImage(named: "top_bar_back") : UIImage(named: "top_bar_back")?.flipImage, for: .normal)
        self.loaderView.startAnimating()
    }
    
    func bindData() {
        self.viewModel.didSelectSubCategory = { [weak self] in
            guard let self = self else { return }
            
            self.loaderView.stopAnimating()
            self.loaderView.isHidden = true
            self.collectionView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
