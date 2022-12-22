//
//  APICaller.swift
//  Making-Cocktails
//
//  Created by Quang Khánh on 20/12/2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    private let session: URLSession
    
    private init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }

    func getJSON<D: Codable>(url: String, completion: @escaping (D?, Error?) -> Void ) {
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = MethodRequest.get.rawValue
        
        let task = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, NetworkError.badResponse)
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(nil, NetworkError.badStatusCode(httpResponse.statusCode))
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.badData)
                return
            }
            
            do {
                let results = try JSONDecoder().decode(D.self, from: data)
                    completion(results, nil)
            } catch let error {
                print(error)

            }
        }
        task.resume()
    }
    
    func getImage(imageURL: String, completion: @escaping (Data?, Error?) -> (Void)) {
        guard let url = URL(string: imageURL) else {
            completion(nil, NetworkError.badData)
            return
        }
        
        let task = session.downloadTask(with: url) { (localUrl: URL?, response: URLResponse?, error: Error?) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, NetworkError.badResponse)
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badStatusCode(httpResponse.statusCode))
                }
                return
            }
            
            guard let localUrl = localUrl else {
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badData)
                }
                return
            }
            
            do {
                let data = try Data(contentsOf: localUrl)
                DispatchQueue.main.async {
                    completion(data, nil)
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
