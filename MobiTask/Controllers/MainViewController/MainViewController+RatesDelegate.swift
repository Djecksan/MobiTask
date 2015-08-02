//
//  MainViewController+RatesDelegate.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 02.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

extension MainViewController:RatesDelegate {
    
    func setRate(value:Float, currency:String) {
        currentСurrency = currency
        
        var k           = 1000.0
        var result      = Float(round(k * Double(value)) / k)
        self.rates.text = "\(result)"
        
        if topCurrencyLabelConstraint.constant != 0 {
            self.toggleMenu(nil)
        }
    }
    
}