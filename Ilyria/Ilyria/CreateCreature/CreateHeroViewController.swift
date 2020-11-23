//
//  CreateHeroViewController.swift
//  Ilyria
//
//  Created by mickey on 2020-11-16.
//

import UIKit

class CreateHeroViewController: UIViewController {

    var hero: Hero?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var healthPointsTextField: UITextField!
    @IBOutlet weak var healthPointsStepper: UIStepper!
    
    @IBOutlet weak var damageTextField: UITextField!
    @IBOutlet weak var damageStepper: UIStepper!
    
    @IBOutlet weak var creatureTypeSelectButton: UIButton!
    
    var initialHealth: Double
    var initialDamage: Double
    var creatureType: CreatureType = .hero
    
    var newHeroCreated: ((Hero?, Monster?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        healthPointsTextField.text = "\(Int(initialHealth.rounded()))"
        damageTextField.text = "\(Int(initialDamage.rounded()))"
        setupUI()
    }
    
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveHero))
        
        creatureTypeSelectButton.setTitle("Select Creature Type", for: .normal)
    }
    
    //MARK: Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.initialHealth = GlobalConstants.baseHealth
        self.initialDamage = GlobalConstants.baseDamage
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        self.initialHealth = GlobalConstants.baseHealth
        self.initialDamage = GlobalConstants.baseDamage
        super.init(coder: coder)
    }
    
    convenience init(health: Double, damage: Double) {
        self.init()
        initialHealth = health
        initialDamage = damage
    }
    
    
    //MARK: Action methods
    
    @IBAction func updateHealthPoint(_ stepper: UIStepper) {
        let current = Int(initialHealth) + Int(stepper.value.rounded())
        healthPointsTextField.text = "\(current)"
    }
    
    @IBAction func updateDamage(_ stepper: UIStepper) {
        let current = Int(initialDamage) +  Int(stepper.value.rounded())
        damageTextField.text = "\(current)"
    }
    
    @IBAction func selectCreatureType(_ sender: UIButton) {
        let alert = UIAlertController(title: "Select Creature Type", message: "", preferredStyle: .actionSheet)
        let heroAlertAction = UIAlertAction(title: "Hero", style: .default) { [weak self] (action) in
            print("creature type HERO selected")
            self?.creatureTypeSelectButton.setTitle("Hero", for: .normal)
            self?.creatureType = .hero
        }
        let monsterAlertAction = UIAlertAction(title: "Monster", style: .default) { [weak self] (action) in
            print("creature type MONSTER selected")
            self?.creatureTypeSelectButton.setTitle("Monster", for: .normal)
            self?.creatureType = .monster
        }
        let npcAlertAction = UIAlertAction(title: "NPC", style: .default) { [weak self] (action) in
            print("creature type MONSTER selected")
            self?.creatureTypeSelectButton.setTitle("NPC", for: .normal)
            self?.creatureType = .npc
        }
        
        alert.addAction(heroAlertAction)
        alert.addAction(monsterAlertAction)
        alert.addAction(npcAlertAction)
        
        present(alert, animated: true) {
            print("creature type selected")
        }
        
    }
    
    @objc func saveHero() {
        guard let name = nameTextField.text, let hpStr = healthPointsTextField.text, let hp = Int(hpStr), let dmgStr = damageTextField.text, let dmg = Int(dmgStr)  else { return }
        
        if self.creatureType == .monster {
            let monster = Monster(name: name, health: hp, damage: dmg)
            newHeroCreated?(nil, monster)
        } else {
            let hero = Hero(name: name, health: hp, damage: dmg)
            newHeroCreated?(hero, nil)
        }

        print("save button tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
}
