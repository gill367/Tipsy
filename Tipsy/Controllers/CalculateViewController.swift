//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    let SG_NAME = "gotoResult"
    var splitBrain = SplitBrain()
    var selectedTip = 10
    var noOfSplits = 2
    @IBOutlet weak var totalTextField: UITextField!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func resetTipButton() {
        tip0Button.isSelected = false
        tip10Button.isSelected = false
        tip20Button.isSelected = false
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        self.resetTipButton()
        view.endEditing(true)
        let senderText: String = sender.currentTitle ?? ""
        let tipString = senderText.dropLast()
        print(tipString)
        selectedTip = Int(tipString) ?? 0
        sender.isSelected = !sender.isSelected
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
       
        let totalAmount = Float(totalTextField.text ?? "0.00")
        splitBrain.calculateSplit(total: totalAmount ?? 0, tip: selectedTip, noOfSplits: noOfSplits)
        // navigate now
        self.performSegue(withIdentifier: SG_NAME, sender: self)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitLabel.text = String(format:"%0.f", sender.value)
        noOfSplits = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SG_NAME {
            let resultController = segue.destination as! ResultsViewController
            let split = splitBrain.getSplit()
            print(split)
            resultController.split = splitBrain.getSplit()
        }
    }
    
}

