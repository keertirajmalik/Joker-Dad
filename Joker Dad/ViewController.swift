//
//  ViewController.swift
//  Joker Dad
//
//  Created by Keertiraj Laxman Malik on 11/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var jokeView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showNewJoke(_ sender: UIButton) {
        jokeView.text = "showing some text at the moment"
    }
    

}

