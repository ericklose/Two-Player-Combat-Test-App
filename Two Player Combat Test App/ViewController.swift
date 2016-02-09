//
//  ViewController.swift
//  Two Player Combat Test App
//
//  Created by Eric Klose on 2/9/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func leftOrcPicked2() {
        leftOrc.hidden = false
        leftPlayerSelection.hidden = true
        leftHpLbl.hidden = false
        leftAttackBtn.hidden = false
        leftAttackLbl.hidden = false
    }
    

    @IBAction func onPressedLeftAttackBtn(sender: AnyObject) {
    }
    
    @IBAction func onPressedRightAttackBtn(sender: AnyObject) {
    }
    
    @IBAction func onPressedLeftOrcBtn(sender: AnyObject) {
        leftOrcPicked2()
    }
    
    @IBAction func onPressedLeftSoldierBtn(sender: AnyObject) {
    }

    @IBAction func onPressedRightOrcBtn(sender: AnyObject) {
    }
    
    @IBAction func onPressedRightSoldierBtn(sender: AnyObject) {
    }
    
}

