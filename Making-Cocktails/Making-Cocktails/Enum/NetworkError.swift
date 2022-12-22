//
//  NetworkError.swift
//  Making-Cocktails
//
//  Created by Quang Khánh on 20/12/2022.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case badStatusCode(Int)
    case badData
}
