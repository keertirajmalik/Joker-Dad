//
//  StringExtension.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 07/06/22.
//

import Foundation

extension String {
    func processJoke() -> String {
        let jokes =  self.components(separatedBy: "?")
        if jokes.count > 1 {
            return jokes[0] + " ? " + "\n\n" + jokes[1]
        }
        return self
    }
}
