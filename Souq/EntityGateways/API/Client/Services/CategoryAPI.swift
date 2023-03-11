//
//  CategoryAPI.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

protocol CategoryAPI {
    func getCategory(callBack: @escaping (Result<[Category], Error>) -> Void)
    func getSubCategory(categoryId: Int, callBack: @escaping (Result<[Category], Error>) -> Void)
}

class CategoryAPIImplementation: BaseAPI<CategoryNetwork>, CategoryAPI {
    func getCategory(callBack: @escaping (Result<[Category], Error>) -> Void) {
        self.sendRequest(target: .getCategory, responseClass: [Category].self, callBack: callBack)
    }
    
    func getSubCategory(categoryId: Int, callBack: @escaping (Result<[Category], Error>) -> Void) {
        self.sendRequest(target: .getSubCategory(categoryId: categoryId), responseClass: [Category].self, callBack: callBack)
    }
}
