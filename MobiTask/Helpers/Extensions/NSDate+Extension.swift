//
//  NSDate+Extension.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 02.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

extension NSDate {
    func stringDateWithFormat (format:String)-> String {
        var formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
}