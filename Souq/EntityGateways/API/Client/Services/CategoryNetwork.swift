//
//  CategoryNetwork.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation
import Alamofire

enum CategoryNetwork {
    case getCategory,
         getSubCategory(categoryId: Int)
}

extension CategoryNetwork: TargetType {
    var baseURL: String {
        switch self {
        default:
            return BASEURL
        }
    }
    
    var path: String {
        switch self {
        case .getCategory:
            return "ParentCatgories"
        case .getSubCategory(let categoryId):
            return "SubCategories?categoryId=\(categoryId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCategory, .getSubCategory:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCategory, .getSubCategory:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return [:]
        }
    }
}
