//
//  ViewController.swift
//  Tic
//
//  Created by Neel Patel on 09/11/16.
//  Copyright © 2016 Neel Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name1: UITextField!
    
    @IBOutlet weak var name2: UITextField!
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enter(_ sender: AnyObject) {
        
       // var neel: String
       // neel = name1.text!
      //  var preet: String
      //  preet = name2.text!
        
        
    }
    
    

    @IBAction func action(_ sender: AnyObject) {
        
        var neel: String
        neel = name1.text!
        var preet: String
        preet = name2.text!

        
        if (gameState[sender.tag-1] == 0) //&& gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "\(neel) has WON!!!"
                }
                else
                {
                    label.text = "\(preet) has WON!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "IT WAS A DRAW"
            label.isHidden = false
            playAgainButton.isHidden = false
        }


        
    }

    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }

        
        
        
    }
    
    
}

