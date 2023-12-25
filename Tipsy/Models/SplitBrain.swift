//
//  SplitBrain.swift
//  Tipsy
//
//  Created by Gill on 2023-12-24.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct SplitBrain {
    
    var split: Split?
    
    mutating func calculateSplit(total: Float, tip: Int, noOfSplits: Int) {
        let totalAmountWithTip = total + ( (Float(tip) * total) / 100)
        let splitPerPerson = totalAmountWithTip / Float(noOfSplits)
       
        self.split = Split(amountPerPerson: splitPerPerson, tip: tip, splitCount: noOfSplits)
    
        
    }
    
    func getSplit() -> Split{
        return self.split ?? Split(amountPerPerson: 0.00, tip: 0, splitCount: 2)
    }
    
}
