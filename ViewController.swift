//
//  ViewController.swift
//  tapper-game
//
//  Created by Adam Armendariz on 5/25/19.
//  Copyright © 2019 Adam Armendariz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps: Int = 0
    var currTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currTaps += 1
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            logoImg.isHidden = true
            playBtn.isHidden = true
            howManyTapsTxt.isHidden = true
            
            tapBtn.isHidden = false
            tapsLbl.isHidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currTaps = 0
            
            updateTapsLbl()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.isHidden = false
        playBtn.isHidden = false
        howManyTapsTxt.isHidden = false
        
        tapBtn.isHidden = true
        tapsLbl.isHidden = true
    }
    
    func isGameOver() -> Bool {
        return currTaps >= maxTaps
    }
    
    func updateTapsLbl() {
       tapsLbl.text = "\(currTaps) Taps"
    }
}

