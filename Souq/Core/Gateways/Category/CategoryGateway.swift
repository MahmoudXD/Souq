//
//  CategoryGateway.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

protocol CategoryGateway {
    func getCategory(callBack: @escaping (Result<[Category], Error>) -> Void)
    func getSubCategory(categoryId: String,
                        callBack: @escaping (Result<[Category], Error>) -> Void)
}
