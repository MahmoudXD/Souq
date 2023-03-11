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
    let showInHomePage : Bool?
    let seoName : String?
    let picture : String?
    let descriptionAr : String?
    let descriptionEn : String?
    let description : String?
    let order : Int?
    let active : Bool?
    let parentId : String?
    let parentNameAr : String?
    let parentNameEn : String?
    let parentName : String?
    let rowNumber : Int?
    let subcategories : String?
    let ads : String?
    let subProductCategoriesCount : Int?
    let disabled : Bool?
    let popupCommercialAd : String?
    let isLastChild : Bool?

    enum CodingKeys: String, CodingKey {

        case productCategoryId = "ProductCategoryId"
        case nameAr = "NameAr"
        case nameEn = "NameEn"
        case name = "Name"
        case showInHomePage = "ShowInHomePage"
        case seoName = "SeoName"
        case picture = "Picture"
        case descriptionAr = "DescriptionAr"
        case descriptionEn = "DescriptionEn"
        case description = "Description"
        case order = "Order"
        case active = "Active"
        case parentId = "ParentId"
        case parentNameAr = "ParentNameAr"
        case parentNameEn = "ParentNameEn"
        case parentName = "ParentName"
        case rowNumber = "RowNumber"
        case subcategories = "Subcategories"
        case ads = "Ads"
        case subProductCategoriesCount = "SubProductCategoriesCount"
        case disabled = "Disabled"
        case popupCommercialAd = "PopupCommercialAd"
        case isLastChild = "IsLastChild"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productCategoryId = try values.decodeIfPresent(Int.self, forKey: .productCategoryId)
        nameAr = try values.decodeIfPresent(String.self, forKey: .nameAr)
        nameEn = try values.decodeIfPresent(String.self, forKey: .nameEn)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        showInHomePage = try values.decodeIfPresent(Bool.self, forKey: .showInHomePage)
        seoName = try values.decodeIfPresent(String.self, forKey: .seoName)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        descriptionAr = try values.decodeIfPresent(String.self, forKey: .descriptionAr)
        descriptionEn = try values.decodeIfPresent(String.self, forKey: .descriptionEn)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        parentId = try values.decodeIfPresent(String.self, forKey: .parentId)
        parentNameAr = try values.decodeIfPresent(String.self, forKey: .parentNameAr)
        parentNameEn = try values.decodeIfPresent(String.self, forKey: .parentNameEn)
        parentName = try values.decodeIfPresent(String.self, forKey: .parentName)
        rowNumber = try values.decodeIfPresent(Int.self, forKey: .rowNumber)
        subcategories = try values.decodeIfPresent(String.self, forKey: .subcategories)
        ads = try values.decodeIfPresent(String.self, forKey: .ads)
        subProductCategoriesCount = try values.decodeIfPresent(Int.self, forKey: .subProductCategoriesCount)
        disabled = try values.decodeIfPresent(Bool.self, forKey: .disabled)
        popupCommercialAd = try values.decodeIfPresent(String.self, forKey: .popupCommercialAd)
        isLastChild = try values.decodeIfPresent(Bool.self, forKey: .isLastChild)
    }

}
