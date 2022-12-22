//
//  DrinkRepository.swift
//  Making-Cocktails
//
//  Created by Quang Khánh on 20/12/2022.
//

import Foundation

final class DrinkRepository: RepositoryType {
    
    typealias D = Drink
    private let network = APICaller.shared

    func getAllDrinks(urlAPi: String, completion: @escaping ([Drink]?, Error?) -> Void) {
        network.getJSON(url: urlAPi) { (data: Drinks?, error) in
            var domainDrinksList = [Drink]()
            if let data = data {
                for drink in data.drinks {
                    domainDrinksList.append(Drink(
                        strDrink: drink.strDrink,
                        strCategory: drink.strCategory,
                        strDrinkThumb: drink.strDrinkThumb))
                }
                completion(domainDrinksList, nil)
            }
        }
    }
}
