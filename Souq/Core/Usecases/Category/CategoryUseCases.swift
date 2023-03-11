//
//  Category.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

protocol CategoryUseCase {
    func getCategory(callBack: @escaping (Result<[Category], Error>) -> Void)
    func getSubCategory(categoryId: String,
                        callBack: @escaping (Result<[Category], Error>) -> Void)
}

class CategoryUseCaseImplementation: CategoryUseCase {
    
    private let categoryGateway: CategoryGateway

    init(categoryGateway: CategoryGateway) {
        self.categoryGateway = categoryGateway
    }

    func getCategory(callBack: @escaping (Result<[Category], Error>) -> Void) {
        self.categoryGateway.getCategory(callBack: callBack)
    }
    
    func getSubCategory(categoryId: String, callBack: @escaping (Result<[Category], Error>) -> Void) {
        self.categoryGateway.getSubCategory(categoryId: categoryId, callBack: callBack)
    }
}
