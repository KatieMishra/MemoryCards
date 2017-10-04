//
//  main.swift
//  RockPaperScissors
//
//  Created by Katie Mishra on 8/25/17.
//  Copyright © 2017 AT CS. All rights reserved.
//

import Foundation
import ImageIO
import UIKit

class MemoryCards {
    
    var matrix: [UIImage] = []
    var userMatrix: [UIImage] = []
    var displayMatrix: [UIImage] = []
    
    //computer generated matrix, randomized
    func computerMatrix() -> [UIImage] {
        var matrix = [#imageLiteral(resourceName: "bunny"),#imageLiteral(resourceName: "bunny"),#imageLiteral(resourceName: "dog"),#imageLiteral(resourceName: "dog"),#imageLiteral(resourceName: "cat"),#imageLiteral(resourceName: "cat")]
        var randomizedMatrix: [UIImage] = []
        while (!matrix.isEmpty) {
            let randomIndex = 0 + Int(arc4random_uniform(UInt32((matrix.count-1) - 0 + 1)))
            randomizedMatrix.append(matrix[randomIndex])
            matrix.remove(at: randomIndex)
        }
        return randomizedMatrix
    }
    
    //compare computer matrix to user guess to see if the cards match
    func compareGuessToMatrix(guess: [Int]) -> String {
        if (guess[0] > (matrix.count-1)) {
            return("First index out of range, please enter another an index between 0 and \(matrix.count-1)")
        } else if (guess[1] > (matrix.count-1)) {
            return("Second index out of range, please enter another an index between 0 and \(matrix.count-1)")
        } else if (guess[0] == guess[1]) {
            return("Second index cannot equal first index. Please enter a value other than \(guess[0]): ")
        } else {
            if (matrix[guess[0]] == matrix[guess[1]]) {
                displayMatrix[guess[0]] = matrix[guess[0]]
                displayMatrix[guess[1]] = matrix[guess[1]]
                userMatrix[guess[0]] = matrix[guess[0]]
                userMatrix[guess[1]] = matrix[guess[1]]
                return "Great job! Those cards match."
            }
            displayMatrix[guess[0]] = matrix[guess[0]]
            displayMatrix[guess[1]] = matrix[guess[1]]
            return "Those cards don't match, try again."
        }
    }
    
    //run game sequence
    func playGame() {
        matrix = computerMatrix()
        userMatrix = [#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card")]
        displayMatrix = [#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "card")]
    }
}
