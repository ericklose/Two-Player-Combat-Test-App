//
//  ViewController.swift
//  Two Player Combat Test App
//
//  Created by Eric Klose on 2/9/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftPlayerPicked = false
    var rightPlayerPicked = false
    var leftPlayer: Character!
    var rightPlayer: Character!
    
    
    @IBOutlet weak var leftAttackBtn: UIButton!
    @IBOutlet weak var leftAttackLbl: UILabel!
    @IBOutlet weak var rightAttackBtn: UIButton!
    @IBOutlet weak var rightAttackLbl: UILabel!
    
    @IBOutlet weak var mainTextLbl: UILabel!
    @IBOutlet weak var leftPlayerSelection: UIStackView!
    @IBOutlet weak var rightPlayerSelection: UIStackView!
    
    @IBOutlet weak var leftHpLbl: UILabel!
    @IBOutlet weak var rightHpLbl: UILabel!
    
    
    @IBOutlet weak var leftSoldier: UIImageView!
    @IBOutlet weak var leftOrc: UIImageView!
    @IBOutlet weak var rightOrc: UIImageView!
    @IBOutlet weak var rightSoldier: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initialGameState() {
        leftOrc.hidden = true
        rightOrc.hidden = true
        leftSoldier.hidden = true
        rightSoldier.hidden = true
        leftAttackLbl.hidden = true
        rightAttackLbl.hidden = true
        leftAttackBtn.hidden = true
        rightAttackBtn.hidden = true
        leftPlayerSelection.hidden = false
        rightPlayerSelection.hidden = false
        leftPlayerPicked = false
        rightPlayerPicked = false
    }

    
    func leftOrcPicked2() {
        leftOrc.hidden = false
        leftPlayerSelection.hidden = true
        leftPlayerPicked = true
        leftPlayer = Orc(startingHp: 50, attackPwr: 10, playerSide: "Left")
    }
    
    func rightOrcPicked2() {
        rightOrc.hidden = false
        rightPlayerSelection.hidden = true
        rightPlayerPicked = true
        rightOrc.transform = CGAffineTransformMakeScale(-1, 1)
        rightPlayer = Orc(startingHp: 50, attackPwr: 10, playerSide: "Right")

    }
    
    func leftSoldierPicked2() {
        leftSoldier.hidden = false
        leftPlayerSelection.hidden = true
        leftPlayerPicked = true
        leftSoldier.transform = CGAffineTransformMakeScale(-1, 1)
        leftPlayer = Soldier(startingHp: 50, attackPwr: 10, playerSide: "Left")

    }
    
    func rightSoldierPicked2() {
        rightSoldier.hidden = false
        rightPlayerSelection.hidden = true
        rightPlayerPicked = true
        rightPlayer = Soldier(startingHp: 50, attackPwr: 10, playerSide: "Right")
    }
    
    func bothSidesPicked() {
        rightHpLbl.hidden = false
        rightAttackBtn.hidden = false
        rightAttackLbl.hidden = false
        leftHpLbl.hidden = false
        leftAttackBtn.hidden = false
        leftAttackLbl.hidden = false
    }
    
    func bothReady() -> Bool {
        if rightPlayerPicked == true && leftPlayerPicked == true {
            bothSidesPicked()
            
        }
        return true
    }
    

    
    @IBAction func onPressedLeftAttackBtn(sender: AnyObject) {
        mainTextLbl.text = "\(leftPlayer.name) attacks for \(leftPlayer.attackPwr) damage!"
        leftPlayer.attemptAttack(rightPlayer.attackPwr)
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "leftAttack", userInfo: nil, repeats: false)
        
        if !rightPlayer.isAlive {
            rightHpLbl.text = ""
            mainTextLbl.text = "Killed \(rightPlayer.name)"
            rightOrc.transform = CGAffineTransformMakeScale(-1, -1)
            rightSoldier.transform = CGAffineTransformMakeScale(-1, -1)

        }
    }
    
    @IBAction func onPressedRightAttackBtn(sender: AnyObject) {
        mainTextLbl.text = "\(rightPlayer.name) attacks for \(rightPlayer.attackPwr) damage!"
        rightPlayer.attemptAttack(leftPlayer.attackPwr)
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "rightAttack", userInfo: nil, repeats: false)
        
        if !leftPlayer.isAlive {
            leftHpLbl.text = ""
            mainTextLbl.text = "Killed \(leftPlayer.name)"
            leftOrc.transform = CGAffineTransformMakeScale(-1, -1)
            leftSoldier.transform = CGAffineTransformMakeScale(-1, -1)

        }
    }
    
    @IBAction func onPressedLeftOrcBtn(sender: AnyObject) {
        leftOrcPicked2()
        bothReady()
        
    }
    
    @IBAction func onPressedLeftSoldierBtn(sender: AnyObject) {
        leftSoldierPicked2()
        bothReady()
    }

    @IBAction func onPressedRightOrcBtn(sender: AnyObject) {
        rightOrcPicked2()
        bothReady()
    }
    
    @IBAction func onPressedRightSoldierBtn(sender: AnyObject) {
        rightSoldierPicked2()
        bothReady()
    }
    
}

