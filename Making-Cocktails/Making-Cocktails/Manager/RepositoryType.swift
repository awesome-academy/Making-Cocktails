//
//  RepositoryType.swift
//  Making-Cocktails
//
//  Created by Quang Khánh on 20/12/2022.
//

import Foundation

protocol RepositoryType {
    
    associatedtype D
    
    func getAllDrinks(urlAPi: String, completion: @escaping ([D]?, Error?) -> Void)
}

