//
//  JokeResource.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 07/06/22.
//

import Foundation
import Network

struct JokeResource {
    
    func fetchJoke(completionHandler: @escaping(_ result: JokeResponse?)->()) {
        
        var urlRequest = URLRequest(url: URL(string: API.URL)!)
        urlRequest.addValue(API.acceptHeader, forHTTPHeaderField: "Accept")
        
        HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: JokeResponse.self) { result in
            _ = completionHandler(result)
        }
    }
}
