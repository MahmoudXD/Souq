//
//  Category.swift
//  Souq
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import Foundation

struct Category : Codable {
    let productCategoryId : Int?
    let nameAr : String?
    let nameEn : String?
    let name : String?
    let picture : String?
    let isLastChild : Bool?

    enum CodingKeys: String, CodingKey {

        case productCategoryId = "ProductCategoryId"
        case nameAr = "NameAr"
        case nameEn = "NameEn"
        case name = "Name"
        case picture = "Picture"
        case isLastChild = "IsLastChild"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productCategoryId = try values.decodeIfPresent(Int.self, forKey: .productCategoryId)
        nameAr = try values.decodeIfPresent(String.self, forKey: .nameAr)
        nameEn = try values.decodeIfPresent(String.self, forKey: .nameEn)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        isLastChild = try values.decodeIfPresent(Bool.self, forKey: .isLastChild)
    }

}
