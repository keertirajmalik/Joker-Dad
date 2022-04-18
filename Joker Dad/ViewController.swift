//
//  ViewController.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 11/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var jokeView: UILabel!
    @IBOutlet var cardView: CardView!
    var jokeManager = JokeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jokeManager.delegate = self
        jokeManager.fetchJoke(with: "https://icanhazdadjoke.com")
    }
    
    @IBAction func showNewJoke(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            // when user move the card to the edge of the screen the card is taken out from screen
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                showNewJokeCard()
                
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                showNewJokeCard()
            }
            
            // If the card moved from centre once finger is lifted the card will snapped back to the centre again.
            UIView.animate(withDuration: 0.4) {
                card.center = self.view.center
            }
        }
    }
    
    func showNewJokeCard() {
            self.cardView.center = self.view.center
            self.cardView.alpha = 1
            self.jokeManager.fetchJoke(with: "https://icanhazdadjoke.com")
    }
}

extension ViewController: JokeManagerDelegate {
    func fetchDadJoke(_ jokeManager: JokeManager, joke: JokeModel) {
        
        DispatchQueue.main.async {
            self.jokeView.text = joke.joke
        }
    }
}
