//
//  Monster.swift
//  Ilyria
//
//  Created by mickey on 2020-11-15.
//

import Foundation

enum MonsterType: String, Codable {
    case devil, aberration, demon, beast, dragon
}

class Monster: Creature, Codable {
    var creatureType: CreatureType
    
    var name: String
    var healthPoints: Int
    var damageValue: Int
    
    var monsterType: MonsterType
    
    init(name: String, health: Int, damage: Int, monsterType: MonsterType = .beast) {
        self.name = name
        self.healthPoints = health
        self.damageValue = damage
        self.monsterType = monsterType
        self.creatureType = .monster
    }
    
    func takeDamage(by hero: Hero) -> String {
        guard !amIDead else {
            print("Monster \(name) is already dead")
            return "\nMonster \(name) is already dead"
        }
        
        self.healthPoints -= hero.damageValue
        if amIDead {
            print("Monster \(name) killed by \(hero.name)")
            return "\nMonster \(name) killed by \(hero.name)"
        }
        
        print("\(monsterType.rawValue.capitalized) \(name) has taken \(hero.damageValue) points of damage. Current health: \(healthPoints)")
        return "\n\(monsterType.rawValue.capitalized) \(name) has taken \(hero.damageValue) points of damage. Current health: \(healthPoints)"
    }
    
    func attack() -> Int {
        return damageValue
    }
    
}
