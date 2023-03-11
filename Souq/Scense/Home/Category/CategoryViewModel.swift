//
//  CategoryViewModel.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

class CategoryViewModel {
    
    var categoryUseCase: CategoryUseCase?
    var categories: [Category] = [Category]() {
        didSet {
            self.didCategoryFetch?()
        }
    }
    
    var didCategoryFetch: (() -> Void)?
    var didNoHasChild: (() -> Void)?
    var didSelectCategory: ((Int) -> Void)?
    
    init() {
        let categoryAPI: CategoryAPI = CategoryAPIImplementation()
        let categoryGateway: CategoryGateway = APIGatewayCategoryImplementation(categoryAPI: categoryAPI)
        categoryUseCase = CategoryUseCaseImplementation(categoryGateway: categoryGateway)
    }
    
    var numberOfCatrgory: Int {
        return categories.count
    }
    
    func viewDidLoad() {
        self.fetchCategory()
    }
    
    func fetchCategory() {
        self.categoryUseCase?.getCategory { result in
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
    
    func didSelectCell(indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        if !(category.isLastChild ?? true) {
            self.didSelectCategory?(category.productCategoryId ?? -1)
        } else {
            self.didNoHasChild?()
        }
    }
}
