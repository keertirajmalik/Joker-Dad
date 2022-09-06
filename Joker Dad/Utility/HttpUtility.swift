//
//  HttpUtility.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 07/06/22.
//

import Foundation

struct HttpUtility {
    static let shared = HttpUtility()
    
    func performDataTask<T:Decodable>(urlRequest: URLRequest, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        
        URLSession.shared.dataTask(with: urlRequest) { (responseData, _, error) in
            if(error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                } catch let error {
                    debugPrint("error while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
