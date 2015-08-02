//
//  RatesViewController.swift
//  MobiTask
//
//  Created by Evgenyi Tyulenev on 01.08.15.
//  Copyright (c) 2015 VoltMobi. All rights reserved.
//

import UIKit

protocol RatesDelegate:NSObjectProtocol {
    func setRate(value:Float, currency:String)
}

private let cellIdentifier = "rateIdentifier"

class RatesViewController: UITableViewController {
    
    weak var delegate:RatesDelegate?
    var rates:[String:Float]? {
        didSet
        {
            self.displayItems = rates?.keys.array
            self.tableView.reloadData()
            self.selectedCellWithDefaultCurrency()
        }
    }
    
    var displayItems:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func selectedCellWithDefaultCurrency() {
        for (index, item) in enumerate(self.displayItems) {
            if item == DEFAULT_CURRENCY {
                let indexPath = NSIndexPath(forRow: index, inSection: 0)
                self.tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
                self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: false)
            }
        }
    }
}

// MARK: - Table view data source
extension RatesViewController:UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RateCell
        var item = self.displayItems[indexPath.row]
        cell.title.text = "\(DEFAULT_BASE_CURRENCY) ➔ \(item)"
        
        return cell
    }
}

// MARK: - Table view delegate
extension RatesViewController:UITableViewDelegate {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var key = self.displayItems[indexPath.row]
        if let value = self.rates?[key] {
            self.delegate?.setRate(value, currency: key)
        }
    }
}
