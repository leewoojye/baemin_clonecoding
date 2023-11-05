//
//  data.swift
//  baemin
//
//  Created by Woo Jye Lee on 11/3/23.
//

import Foundation

struct ItemListData {
    let image: String
    let size: String
    let price: String
    var isLike: Bool
    
    init(image: String, size: String, price: String, isLike: Bool) {
        self.image = image
        self.size = size
        self.price = price
        self.isLike = isLike
    }
}
