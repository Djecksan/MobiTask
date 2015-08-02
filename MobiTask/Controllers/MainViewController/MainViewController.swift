//
//  MainViewController.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 31.07.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

private let RATES_IDENTIFIER    = "RatesViewController"
let DEFAULT_CURRENCY            = "RUB"
let DEFAULT_BASE_CURRENCY       = "USD"

protocol YesterdayRate:NSObjectProtocol {
    func loadYesterdayRates()
}

protocol Menu:NSObjectProtocol {
    func toggleMenu(sender:AnyObject?)
}

class MainViewController: UIViewController {

    @IBOutlet weak var currency     : UILabel!
    @IBOutlet weak var rates        : UILabel!
    @IBOutlet weak var dollarUpdate : UILabel!
    @IBOutlet weak var infoBlock    : UIView!
    @IBOutlet weak var updateTime   : UILabel!
    
    @IBOutlet weak var topCurrencyLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var topRatesConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomRatesConstraint: NSLayoutConstraint!
    
    weak var ratesController        : RatesViewController?
    
    var todayFixer                  : Fixer? {
        didSet {

            if let value = self.todayFixer?.rates?[DEFAULT_CURRENCY] {
                self.setRate(value, currency: DEFAULT_CURRENCY)
            }
            
            self.ratesController?.rates = self.todayFixer?.rates
            self.loadYesterdayRates()
            self.setTimeUpdate()
        }
    }
    
    var currentСurrency             : String! {
        didSet{
            self.currency.text = "\(DEFAULT_BASE_CURRENCY) ➔ \(self.currentСurrency)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInterface()
        self.loadTodayRates()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == RATES_IDENTIFIER {
            self.ratesController = segue.destinationViewController as? RatesViewController
            self.ratesController?.delegate = self
        }
    }
    
    private func setupInterface() {
        self.currency.setSpacing(1)
        self.rates.setSpacing(-4)
        self.dollarUpdate.setLineHeight(1.21)
    }
    
    private func loadTodayRates() {
        
        APIClient.rates("latest?base=\(DEFAULT_BASE_CURRENCY)", success: { [weak self] (result) -> Void in
            
            self!.todayFixer = result as? Fixer
            
            }) { (error, operation) -> Void in
                println("Вывести ошибку")
        }
    }
    
    private func setTimeUpdate() {
        var time = NSDate().stringDateWithFormat("HH:mm")
        updateTime.text = "updated_at".loc() + " \(time)"
    }
}
