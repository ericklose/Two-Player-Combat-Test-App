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

    @IBOutlet weak var restartBtn: UIButton!
    
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
        restartBtn.hidden = true
        leftHpLbl.hidden = true
        rightHpLbl.hidden = true
        rightOrc.transform = CGAffineTransformMakeScale(1, 1)
        leftOrc.transform = CGAffineTransformMakeScale(1, 1)
        rightSoldier.transform = CGAffineTransformMakeScale(1, 1)
        leftSoldier.transform = CGAffineTransformMakeScale(1, 1)
    }

    
    func leftOrcPicked2() {
        leftOrc.hidden = false
        leftPlayerSelection.hidden = true
        leftPlayerPicked = true
        leftPlayer = Orc(startingHp: 40, attackPwr: 15, playerSide: "Left")
    }
    
    func rightOrcPicked2() {
        rightOrc.hidden = false
        rightPlayerSelection.hidden = true
        rightPlayerPicked = true
        rightOrc.transform = CGAffineTransformMakeScale(-1, 1)
        rightPlayer = Orc(startingHp: 40, attackPwr: 15, playerSide: "Right")

    }
    
    func leftSoldierPicked2() {
        leftSoldier.hidden = false
        leftPlayerSelection.hidden = true
        leftPlayerPicked = true
        leftSoldier.transform = CGAffineTransformMakeScale(-1, 1)
        leftPlayer = Soldier(startingHp: 60, attackPwr: 10, playerSide: "Left")

    }
    
    func rightSoldierPicked2() {
        rightSoldier.hidden = false
        rightPlayerSelection.hidden = true
        rightPlayerPicked = true
        rightPlayer = Soldier(startingHp: 60, attackPwr: 10, playerSide: "Right")
    }
    
    func bothSidesPicked() {
        rightHpLbl.hidden = false
        rightAttackBtn.hidden = false
        rightAttackLbl.hidden = false
        leftHpLbl.hidden = false
        leftAttackBtn.hidden = false
        leftAttackLbl.hidden = false
        rightHpLbl.text = "\(rightPlayer.hp) HP"
        leftHpLbl.text = "\(leftPlayer.hp) HP"
        mainTextLbl.text = "Wreck'em!!"
    }
    
    func bothReady() -> Bool {
        if rightPlayerPicked == true && leftPlayerPicked == true {
            bothSidesPicked()
            
        }
        return true
    }
    
    func someoneDied() {
        leftAttackLbl.hidden = true
        rightAttackLbl.hidden = true
        leftAttackBtn.hidden = true
        rightAttackBtn.hidden = true
        leftHpLbl.hidden = true
        rightHpLbl.hidden = true
        restartBtn.hidden = false
    }

    
    @IBAction func onPressedLeftAttackBtn(sender: AnyObject) {
        mainTextLbl.text = "\(leftPlayer.name) attacks for \(leftPlayer.attackPwr) damage!"
        rightPlayer.attemptAttack(leftPlayer.attackPwr)
        rightHpLbl.text = "\(rightPlayer.hp) HP"
        disableButton(leftAttackBtn)
        
        if !rightPlayer.isAlive {
            rightHpLbl.text = ""
            mainTextLbl.text = "\(leftPlayer.name) Killed \(rightPlayer.name)"
            rightOrc.transform = CGAffineTransformMakeScale(-1, -1)
            rightSoldier.transform = CGAffineTransformMakeScale(-1, -1)
            someoneDied()
        }
    }
    
    @IBAction func onPressedRightAttackBtn(sender: AnyObject) {
        mainTextLbl.text = "\(rightPlayer.name) attacks for \(rightPlayer.attackPwr) damage!"
        leftPlayer.attemptAttack(rightPlayer.attackPwr)
        leftHpLbl.text = "\(leftPlayer.hp) HP"
        disableButton(rightAttackBtn)
        
        if !leftPlayer.isAlive {
            leftHpLbl.text = ""
            mainTextLbl.text = "\(rightPlayer.name) Killed \(leftPlayer.name)"
            leftOrc.transform = CGAffineTransformMakeScale(-1, -1)
            leftSoldier.transform = CGAffineTransformMakeScale(-1, -1)
            someoneDied()
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
    
    @IBAction func onPressedRestartBtn(sender: AnyObject) {
        initialGameState()
    }
    
    func enableButton(timer:NSTimer!) {
        
        let btn = timer.userInfo as? UIButton
        btn?.enabled = true
    }
    
    func disableButton(btn: UIButton) {
        btn.enabled = false
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableButton:", userInfo: btn, repeats: false)
    }
    
}

