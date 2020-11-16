//
//  Creature.swift
//  Ilyria
//
//  Created by mickey on 2020-11-15.
//

protocol Creature {
    var name: String { get }
    var healthPoints: Int { get set }
    var damageValue: Int { get set }
    var amIDead: Bool { get }
}

extension Creature {
    var amIDead: Bool {
        return healthPoints <= 0
    }
}



