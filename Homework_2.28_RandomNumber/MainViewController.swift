//
//  ViewController.swift
//  Homework_2.28_RandomNumber
//
//  Created by Ravil on 19.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var maximumLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var generateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateButton.layer.cornerRadius = 12
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.minimumValue = minimumLabel.text
        settingsVC.maximumValue = maximumLabel.text
    }
    
    @IBAction func generateButtonPressed() {
        let minimumNumber = Int(minimumLabel.text ?? "") ?? 0
        let maximumNumber = Int(maximumLabel.text ?? "") ?? 100
        
        resultLabel.text = String(Int.random(in: minimumNumber...maximumNumber))
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        
        minimumLabel.text = settingsVC.minimumTextField.text
        maximumLabel.text = settingsVC.maximumTextField.text
    }
}

