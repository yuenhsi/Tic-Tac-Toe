//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Yuen Hsi Chang on 7/20/15.
//  Copyright (c) 2015 yg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turn = 1
    var grid:[Int] = [0,0,0,0,0,0,0,0,0]
    var winConfig = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameState = true
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    func changeTurn() {
        turn = turn + 1
        if turn == 3 {
            turn = 1
        }
        turnLabel.text = "Player \(turn)'s turn!"
    }
    
    
    func checkWin() {
        for config in winConfig {
            if (grid[config[0]] != 0 && grid[config[0]] == grid[config[1]] && grid[config[1]] == grid[config[2]]) {
            
                gameState = false
                winnerLabel.text = "Player \(turn) won!"
                winnerLabel.hidden = false
                playButton.hidden = false
            
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 400, self.winnerLabel.center.y)
                    self.playButton.center = CGPointMake(self.playButton.center.x + 400, self.playButton.center.y)
                })
            }
        }
    }

    
    @IBAction func playButtonPressed(sender: AnyObject) {
        turn = 1
        grid = [0,0,0,0,0,0,0,0,0]
        
        for (var i = 0; i < 9; i++) {
            var button: UIButton = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        winnerLabel.hidden = true
        playButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 400, winnerLabel.center.y)
        playButton.center = CGPointMake(playButton.center.x - 400, playButton.center.y)
        
        gameState = true
    }
    
    
    @IBAction func moveMade(sender: AnyObject) {
        if grid[sender.tag] == 0 && gameState == true {
            if turn == 1 {
                let image = UIImage(named: "cross.png") as UIImage!
                sender.setImage(image, forState: .Normal)
                grid[sender.tag] = 1            }
            else {
                let image = UIImage(named: "nought.png") as UIImage!
                sender.setImage(image, forState: .Normal)
                grid[sender.tag] = 2
            }
            checkWin()
            changeTurn()
        }
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.hidden = true
        playButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 400, winnerLabel.center.y)
        playButton.center = CGPointMake(playButton.center.x - 400, playButton.center.y)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

