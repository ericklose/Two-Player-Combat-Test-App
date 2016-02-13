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
    private var _name: String = "??? the Mighty"
    
    var playerRace: String {
        return "Race is a Social Construction"
    }
    
    var playerSide: String {
        return "Sides are Relative"
    }
    
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
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    
    
    init (startingHp: Int, attackPwr: Int, playerSide: String) {
        self._hp = startingHp
        self._attackPwr = attackPwr
        self._name = "\(playerSide) \(playerRace)"
    }
    
    func attemptAttack(attackPwr: Int) {
        self._hp -= attackPwr
    }
    
}
