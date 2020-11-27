//
//  Weapon.swift
//  Ilyria
//
//  Created by mickey on 2020-11-26.
//

import Foundation

enum WeaponProperties: String {
    case melee
    case ranged
    case light
    case heavy
    case thrown
    case twoHanded
}

enum WeaponMaterial: String {
    case steel
    case wood
    case iron
    case mithril
    case silver
}

struct TradeValue {
    var buyPrice: Int
    var sellPrice: Int
}

struct MaterialDurability {
    var lowValue: Int
    var highValue: Int
}

enum Durability: Int {
    case low = 1
    case medium
    case high
}

struct Weapon {
    var name: String
    var properties: [WeaponProperties]
    var damageLowerBound: Int
    var damageUpperBound: Int
    var materials: WeaponMaterial
    var tradeValue: TradeValue
    var notes: String
    
    var damageDurabilityModifier: Int
    var durability: Durability
    
    
    mutating func durabilityChanged(to durability: Durability) {
        if durability.rawValue < self.durability.rawValue {
            reduceDamage()
        } else {
            upgradeDamage()
        }
        
        self.durability = durability
    }
    
    mutating private func reduceDamage() {
        self.damageUpperBound -= damageDurabilityModifier
        self.damageLowerBound -= damageDurabilityModifier
    }
    
    mutating private func upgradeDamage() {
        self.damageUpperBound += damageDurabilityModifier
        self.damageLowerBound += damageDurabilityModifier
    }
}
