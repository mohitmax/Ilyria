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
    
    var initialHealth: Double
    var initialDamage: Double
    
    var newHeroCreated: ((Hero) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        healthPointsTextField.text = "\(Int(initialHealth.rounded()))"
        damageTextField.text = "\(Int(initialDamage.rounded()))"
        setupUI()
    }
    
    
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveHero))
    }
    
    @objc func saveHero() {
        guard let name = nameTextField.text, let hpStr = healthPointsTextField.text, let hp = Int(hpStr), let dmgStr = damageTextField.text, let dmg = Int(dmgStr)  else { return }
        let hero = Hero(name: name, health: hp, damage: dmg)
        newHeroCreated?(hero)
        
        print("save button tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.initialHealth = 0.0
        self.initialDamage = 0.0
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        self.initialHealth = 0.0
        self.initialDamage = 0.0
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
    
}
