//
//  ViewController.swift
//  StockPortforlio
//
//  Created by Bo Warren on 3/24/20.
//  Copyright © 2020 rpwarren. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, StockDelegate {
    

    var stocks = [Stock]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Portfolio"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
    }
    
    @objc func addButtonPressed() {
        
        let destinationVC = storyboard?.instantiateViewController(identifier: "InputVC") as! InputViewController
        destinationVC.delegate = self as! StockDelegate
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StockTableViewCell
        cell.nameLabel.text = stocks[indexPath.row].name
        cell.yieldLabel.text = "\(stocks[indexPath.row].yield)%"
        if stocks[indexPath.row].yield < 0 {
            cell.yieldLabel.textColor = .red
        } else {
            cell.yieldLabel.textColor = .green
        }
        cell.tickerLabel.text = stocks[indexPath.row].exchange + ": " + stocks[indexPath.row].symbol
        cell.tickerLabel.textColor = .gray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let stock = stocks[indexPath.row]
        
        let destinationVC = storyboard?.instantiateViewController(identifier: "InputVC") as! InputViewController
        destinationVC.stock = stock
        destinationVC.index = indexPath.row
        destinationVC.delegate = self
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    func addStock(stock: Stock) {
        self.stocks.append(stock)
        print(stocks)
        self.tableView.reloadData()
    }
    
    func removeStock(at index: Int) {
        stocks.remove(at: index)
        tableView.reloadData()
    }
    
}

