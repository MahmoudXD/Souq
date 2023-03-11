//
//  SubCategoryViewModel.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

class SubCategoryViewModel {
    
    var categoryUseCase: CategoryUseCase?
    var categories: [Category] = [Category]() {
        didSet {
            self.didSelectSubCategory?()
        }
    }
    
    var didSelectSubCategory: (() -> Void)?
    var didSelectCategory: ((Int) -> Void)?
    
    init() {
        let categoryAPI: CategoryAPI = CategoryAPIImplementation()
        let categoryGateway: CategoryGateway = APIGatewayCategoryImplementation(categoryAPI: categoryAPI)
        categoryUseCase = CategoryUseCaseImplementation(categoryGateway: categoryGateway)
    }
    
    var numberOfCatrgory: Int {
        return categories.count
    }
    
    func viewDidLoad(index: Int) {
        self.fetchSubCategory(index: index)
    }
    
    func fetchSubCategory(index: Int) {
        self.categoryUseCase?.getSubCategory(categoryId: index) { result in
            switch result {
            case .success(let success):
                self.categories = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func configCell(cell: CategoryCellViewModel, indexPath: IndexPath){
        let category = categories[indexPath.row]
        cell.setTitle(title: "lang".localize == "en" ? category.nameEn ?? "" : category.nameAr ?? "")
        cell.loadImage(url: category.picture ?? "")
    }
}
