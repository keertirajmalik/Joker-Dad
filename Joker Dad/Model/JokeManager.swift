//
//  JokeManager.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 11/04/22.
//

import Foundation

protocol JokeManagerDelegate {
    func fetchDadJoke(_ jokeManager: JokeManager, joke: JokeModel)
}

struct JokeManager {
    
    var delegate: JokeManagerDelegate?
    
    func fetchJoke(with urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!)
                    //                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let dadJoke = self.parseJSON(safeData) {
                        self.delegate?.fetchDadJoke(self, joke: dadJoke)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ jokeData: Data) -> JokeModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
            let joke = decodedData.joke
            
            return JokeModel(joke: joke)
            
        } catch {
            print(error)
            //            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
