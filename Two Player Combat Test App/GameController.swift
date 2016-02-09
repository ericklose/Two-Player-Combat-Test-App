//
//  GameController.swift
//  Two Player Combat Test App
//
//  Created by Eric Klose on 2/9/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import Foundation

class GameController: ViewController {
    
    
    func leftOrcPicked() {
        leftOrc.hidden = false
        leftPlayerSelection.hidden = true
        leftHpLbl.hidden = false
        leftAttackBtn.hidden = false
        leftAttackLbl.hidden = false
    }
    
    
    
}