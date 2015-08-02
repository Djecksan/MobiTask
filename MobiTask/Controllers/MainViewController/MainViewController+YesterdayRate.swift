//
//  MainViewController+YesterdayRate.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 02.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

extension MainViewController:YesterdayRate {
    
    func loadYesterdayRates() {
        var yesterday = NSDate(timeIntervalSinceNow: -86400)
        var sYesterday = yesterday.stringDateWithFormat("YYYY-MM-dd")

        APIClient.rates("latest?base=\(DEFAULT_BASE_CURRENCY)&date=\(sYesterday)&symbols=RUB", success: { [weak self] (result) -> Void in
            
            if let yesterdayFixer = result as? Fixer {
                self!.calculateDifference(yesterdayFixer)
            }
            
            }) { (error, operation) -> Void in
                println("Вывести ошибку")
        }
        
    }
    
    private func calculateDifference(yesterdayFixer:Fixer) {
        let yesterdayValue   = yesterdayFixer.rates![DEFAULT_CURRENCY]!
        let todayValue       = todayFixer!.rates![DEFAULT_CURRENCY]!
        
        var result      = round((todayValue / yesterdayValue) * 100 - 100)
        
        if result < 0 {
            self.dollarUpdate.text = "currancy_fell".loc() + " \(abs(Int(result))) " + "percents".loc()
            self.dollarUpdate.textColor = UIColor.redColor()
        } else if result > 0 {
            self.dollarUpdate.text = "currancy_rose".loc() + " \(abs(Int(result))) " + "percents".loc()
            self.dollarUpdate.textColor = UIColor(red: 126/255.0, green: 211/255.0, blue: 33/255.0, alpha: 1.0)
        } else {
            /*
                Здесь можно обработать случай когда изменений не было.
                Сервис Fixer на выходных не обновляет информацию и отдает значение последнего рабочего дня
            */
        }
        
        //TODO: Написать хелпер для обработки окончаний чтобы не было надписей типа "7 процента"
    }
    
}