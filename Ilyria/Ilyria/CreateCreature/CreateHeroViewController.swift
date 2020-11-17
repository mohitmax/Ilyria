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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        healthPointsTextField.text = "\(Int(initialHealth.rounded()))"
        
    }
    var initialHealth:Double = 0.0
    
    //MARK: Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(health: Double) {
        self.init()
        initialHealth = health
    }
    
    //MARK: Action
    
    @IBAction func updateHealthPoint(_ stepper: UIStepper) {
        let current = Int(initialHealth) + Int(stepper.value.rounded())
        healthPointsTextField.text = "\(current)"
    }
    
}
