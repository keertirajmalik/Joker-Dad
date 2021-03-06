//
//  ViewController.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 11/04/22.
//

import UIKit
import Network

class JokeVC: UIViewController {
    
    @IBOutlet var jokeView: UILabel!
    @IBOutlet var cardView: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewJokeCard()
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
                getNewJokeCard()
                
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                getNewJokeCard()
            }
            
            // If the card moved from centre once finger is lifted the card will snapped back to the centre again.
            UIView.animate(withDuration: 0.4) {
                card.center = self.view.center
            }
        }
    }
    
    func getNewJokeCard() {
        let monitor = NWPathMonitor()
        var joke: String?
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                JokeResource().fetchJoke(completionHandler: { result in
                    if result != nil {
                        joke = result?.joke
                        DispatchQueue.main.async {
                            self.cardView.center = self.view.center
                            self.cardView.alpha = 1
                            self.jokeView.text = joke?.processJoke()
                        }
                    }
                })
                
            } else {
                DispatchQueue.main.async {
                    self.showAlert()
                    self.cardView.center = self.view.center
                    self.cardView.alpha = 1
                    self.jokeView.text = "No internet \n \n  No joke for you."
                }
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
        monitor.cancel()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "No internet", message: "connect to internet to get more dad jokes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
}
