//
//  ViewController.swift
//  Ilyria
//
//  Created by mickey on 2020-11-15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroAttackButton: UIButton!
    @IBOutlet weak var monsterAttackButton: UIButton!
    @IBOutlet weak var combatLogLabel: UILabel!
        
    var hero: Hero?
    var lion: Monster?
    
    var logs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createCreatures()
    }

    func createCreatures() {
        hero = Hero(name: "Hercules", health: 20, damage: 4)
        lion = Monster(name: "Leslie", health: 12, damage: 2)
    }
    
    
    func updateUI() {
        if let isHeroDead = hero?.amIDead, isHeroDead {
            heroAttackButton.isEnabled = false
            heroAttackButton.alpha = 0.2
        } else {
            heroAttackButton.isEnabled = true
            heroAttackButton.alpha = 1
        }
        
        if let isMonsterDead = lion?.amIDead, isMonsterDead {
            monsterAttackButton.isEnabled = false
            monsterAttackButton.alpha = 0.2
        } else {
            monsterAttackButton.isEnabled = true
            monsterAttackButton.alpha = 1
        }
    }
    
    @IBAction func heroAttackAction(_ sender: UIButton) {
        guard let hero = hero else { return }
        
        if let monster = lion {
            let log = monster.takeDamage(by: hero)
            logs.append(log)
            updateCombatLogs()
            
            updateUI()
        }
    }

    @IBAction func monsterAttackAction(_ sender: UIButton) {
        guard let lion = lion else { return }
        
        if let hero = hero {
            let log = hero.takeDamage(by: lion)
            logs.append(log)
            updateCombatLogs()
            
            updateUI()
        }
    }
    
    func updateCombatLogs() {
        let logString = logs.reduce("\n") { (result, log) -> String in
            result + log
        }
        
        combatLogLabel.text = logString
    }
    
}

