//
//  RateCell.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 01.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

class RateCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.title.alpha = selected ? 1.0 : 0.7
        var fontName = selected ? "Lato-Bold" : "Lato-Regular"
        self.title.font  = UIFont(name: fontName, size: 28)
    }

}
