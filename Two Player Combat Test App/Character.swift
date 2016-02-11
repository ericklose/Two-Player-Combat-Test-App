//
//  Character.swift
//  Two Player Combat Test App
//
//  Created by Eric Klose on 2/10/16.
//  Copyright © 2016 Eric Klose. All rights reserved.
//

import Foundation


class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    
    init (startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attack(attackPwr:Int) -> Bool {
        //how do I pass the button used to attack???
        self._hp -= attackPwr
        //NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
        return true
        
    }
    
}
