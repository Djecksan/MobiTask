//
//  Fixer.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 31.07.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//
import ObjectMapper

class Fixer {
    var base    :String?
    var date    :String?
    var rates   :[String:Float]?
}

extension Fixer:Mappable {
    class func newInstance() -> Mappable {
        return Fixer()
    }
    
    // Mappable
    func mapping(map: Map) {
        base    <- map["base"]
        date    <- map["date"]
        rates   <- map["rates"]
    }
}