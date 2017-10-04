//
//  ViewController.swift
//  MemoryCardsApp
//
//  Created by Katie Mishra on 9/20/17.
//  Copyright © 2017 AT CS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = MemoryCards()

    @IBOutlet weak var firstIndex: UITextField!
    @IBOutlet weak var secondIndex: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstIndex.delegate = self
        secondIndex.delegate = self
        label.text = "Welcome to memory cards! Enter an index between 0-5 to find all the matching pairs of cards. Let's get started!"
        game.playGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testMatch(_ sender: Any) {
        if let textEntry = firstIndex.text {
            if let firstIndex = Int(textEntry) {
                if let textEntry2 = secondIndex.text {
                    if let secondIndex = Int(textEntry2) {
                        
                        let guessMatrix = [firstIndex, secondIndex]
                        label.text = game.compareGuessToMatrix(guess: guessMatrix)

                        image0.image = game.displayMatrix[0]
                        image1.image = game.displayMatrix[1]
                        image2.image = game.displayMatrix[2]
                        image3.image = game.displayMatrix[3]
                        image4.image = game.displayMatrix[4]
                        image5.image = game.displayMatrix[5]
                        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
                        DispatchQueue.main.asyncAfter(deadline: when) {
                            self.image0.image = self.game.userMatrix[0]
                            self.image1.image = self.game.userMatrix[1]
                            self.image2.image = self.game.userMatrix[2]
                            self.image3.image = self.game.userMatrix[3]
                            self.image4.image = self.game.userMatrix[4]
                            self.image5.image = self.game.userMatrix[5]
                            for index in 0...5 {
                                self.game.displayMatrix[index] = self.game.userMatrix[index]
                            }
                        }
                    }
                }
            }
        }
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstIndex: firstIndex.becomeFirstResponder()
        case secondIndex:
            secondIndex.resignFirstResponder()
        default:
            secondIndex.resignFirstResponder()
        }
        return true
    }
}

