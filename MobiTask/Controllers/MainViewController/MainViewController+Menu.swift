//
//  MainViewController+Menu.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 02.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

extension MainViewController:Menu {
    @IBAction func toggleMenu(sender:AnyObject?) {
        
        let screenCenter    = CGRectGetHeight(self.view.bounds) / 2
        let heightInfoBlock = CGRectGetHeight(infoBlock.frame)
        
        if topCurrencyLabelConstraint.constant == 0 {
            topCurrencyLabelConstraint.constant = screenCenter - ((heightInfoBlock / 2) + 20)
            topRatesConstraint.constant = -(CGRectGetHeight(self.view.bounds) - (heightInfoBlock + 20))
            bottomRatesConstraint.constant = 0
        } else {
            topCurrencyLabelConstraint.constant = 0
            topRatesConstraint.constant = 0
        }
        
        UIView.animateWithDuration(0.8, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (finish) -> Void in
                self.updateViewConstraints()
        }
    }
}
