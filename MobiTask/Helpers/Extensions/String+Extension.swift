//
//  String+Extension.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 02.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

extension String {
    func loc() -> String  {
        return NSLocalizedString(self, comment: "")
    }
}
