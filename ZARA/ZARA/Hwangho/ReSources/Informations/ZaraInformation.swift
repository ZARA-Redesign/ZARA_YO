//
//  ZaraInformation.swift
//  ZARA
//
//  Created by 송황호 on 2020/12/18.
//

import Foundation

// MARK: - ZaraInformation

struct ZaraInformation: Codable {
    let imgURL: String
    let originPrice: Int
    let isSale: Bool
    let sale: Sale
    let name, category: String
    
    enum CodingKeys: String, CodingKey {
        case imgURL = "imgUrl"
        case originPrice, isSale, sale, name, category
    }
}

// MARK: - Sale
struct Sale: Codable {
    let percent, discountedPrice: Int
}
