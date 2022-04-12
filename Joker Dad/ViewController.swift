//
//  ViewController.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 11/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var jokeView: UITextView!
    
    var jokeManager = JokeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jokeManager.delegate = self
        jokeManager.fetchJoke(with: "https://icanhazdadjoke.com")
    }

    @IBAction func showNewJoke(_ sender: UIButton) {
        jokeManager.fetchJoke(with: "https://icanhazdadjoke.com")
    }

}

extension ViewController: JokeManagerDelegate {
    func fetchDadJoke(_ jokeManager: JokeManager, joke: JokeModel) {
        
        
        DispatchQueue.main.async {
            self.jokeView.text = joke.joke
        }
    }
}
