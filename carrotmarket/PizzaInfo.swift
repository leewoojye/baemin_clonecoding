//
//  PizzaInfo.swift
//  carrotmarket
//
//  Created by Woo Jye Lee on 11/3/23.
//

import Foundation

protocol PizzaInfo: AnyObject {
    var price: String {get set}
    var size: String {get set}
    func pushtoVC()
}
