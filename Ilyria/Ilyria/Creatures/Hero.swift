//
//  Hero.swift
//  Ilyria
//
//  Created by mickey on 2020-11-15.
//

import Foundation

enum HeroClassType: String, Codable {
    case fighter, mage, rogue, cleric
}

class Hero: Creature, Codable {
    
    //Protocol variables
    var damageValue: Int
    var name: String
    var healthPoints: Int
    var creatureType: CreatureType
    
    //Instance variables
    var classType: HeroClassType

    
    init(name: String, health: Int, damage: Int, classType: HeroClassType = .fighter) {
        self.name = name
        self.healthPoints = health
        self.damageValue = damage
        self.classType = classType
        self.creatureType = .hero
    }
    
    func takeDamage(by monster: Monster) -> String {
        guard !amIDead else {
            print("Our hero \(name) is already dead")
            return "\nOur hero \(name) is already dead"
        }
        
        healthPoints -= monster.damageValue
        
        if amIDead {
            print("Hero \(name) has been vanquished by \(monster.monsterType.rawValue) \(monster.name)")
            return "\nHero \(name) has been vanquished by \(monster.monsterType.rawValue) \(monster.name)"
        }
        
        print("Hero \(name) has taken \(monster.damageValue) points of damage. Current health: \(healthPoints)")
        return "\nHero \(name) has taken \(monster.damageValue) points of damage. Current health: \(healthPoints)"
    }
    
    func attack(monster: Monster, for value:Int) -> Int {
        return damageValue
    }
    
}
