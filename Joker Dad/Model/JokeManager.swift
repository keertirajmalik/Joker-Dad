//
//  JokeManager.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 11/04/22.
//

import Foundation

class JokeManager {
            
    func fetchJoke() async throws -> JokeData {
        
        let url = URL(string: "https://icanhazdadjoke.com")!
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(JokeData.self, from: data)
        } catch {
            throw error
        }
    }
    
    func processJoke(joke:String) -> String {
        let jokes =  joke.components(separatedBy: "?")
        if jokes.count > 1 {
            return jokes[0] + " ? " + "\n\n" + jokes[1]
        }
        return joke
    }
}
