//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Gill on 2023-12-24.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var splitResultLabel: UILabel!
    @IBOutlet weak var resultValueLabel: UILabel!
    var split: Split?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let amountPerPerson = split?.amountPerPerson
        let selectedTip = split?.tip ?? 0
        let noOfSplits = split?.splitCount ?? 2
        resultValueLabel.text = String(format: "%.2f", amountPerPerson ?? 0.00)
        splitResultLabel.text = "Split between \(noOfSplits) people with  \(selectedTip)% tip."
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
