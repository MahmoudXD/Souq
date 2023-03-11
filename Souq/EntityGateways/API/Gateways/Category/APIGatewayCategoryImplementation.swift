//
//  APIGatewayCategoryImplementation.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

class APIGatewayCategoryImplementation: CategoryGateway {
    
    private let categoryAPI: CategoryAPI
    
    init(categoryAPI: CategoryAPI) {
        self.categoryAPI = categoryAPI
    }

    func getCategory(callBack: @escaping (Result<[Category], Error>) -> Void) {
        self.categoryAPI.getCategory(callBack: callBack)
    }
    
    func getSubCategory(categoryId: Int, callBack: @escaping (Result<[Category], Error>) -> Void) {
        self.categoryAPI.getSubCategory(categoryId: categoryId, callBack: callBack)
    }
}
