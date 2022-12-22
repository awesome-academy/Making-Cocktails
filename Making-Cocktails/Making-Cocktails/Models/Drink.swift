//
//  Drink.swift
//  Making-Cocktails
//
//  Created by Quang Khánh on 20/12/2022.
//

import Foundation

struct Drinks: Codable {
    var drinks: [Drink]
}

struct Drink: Codable {
    let strDrink: String?
    let strCategory: String?
    let strDrinkThumb: String?
}
