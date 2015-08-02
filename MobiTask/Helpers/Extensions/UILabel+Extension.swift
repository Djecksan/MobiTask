//
//  UILabel+Extension.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 01.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setSpacing(spacing:CGFloat?) {
        self.addAttributes(spacing, nFont: nil, line: nil)
    }
    
    func setLineHeight(line:CGFloat?) {
        self.addAttributes(nil, nFont: nil, line: line)
    }
    
    func addAttributes(spacing:CGFloat?, line:CGFloat?) {
        self.addAttributes(spacing, nFont: nil, line: line)
    }
    
    func addAttributes(spacing:CGFloat?, nFont:UIFont?, line:CGFloat?) {
        
        let font = nFont ?? self.font
        
        let string = NSAttributedString(string: self.text!, attributes:[NSFontAttributeName:font!])
        let attrString = NSMutableAttributedString(attributedString: string)
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineSpacing = line ?? 0
        paraStyle.alignment = self.textAlignment
        
        attrString.addAttributes([NSKernAttributeName : spacing ?? 0, NSParagraphStyleAttributeName:paraStyle], range: NSRange(location: 0,length: attrString.length))
        
        self.attributedText = attrString
    }
}