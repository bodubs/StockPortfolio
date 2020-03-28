//
//  ViewController.swift
//  StockPortforlio
//
//  Created by Bo Warren on 3/24/20.
//  Copyright © 2020 rpwarren. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let stocks = ["Amazon", "Boeing", "Home Depot", "Apple"]
    let yields = [10, 11, 12, -5]
    let exchanges = ["NASDAQ", "NYSE", "NYSE", "NASDAQ"]
    let symbol = ["AMZN", "BA", "HD", "AAPL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Portfolio"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonPressed))
    }
    
    @objc func addButtonPressed() {
        
        let destinationVC = storyboard?.instantiateViewController(identifier: "InputVC") as! InputViewController
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @objc func editButtonPressed() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StockTableViewCell
        cell.nameLabel.text = stocks[indexPath.row]
        cell.yieldLabel.text = "\(yields[indexPath.row])%"
        if yields[indexPath.row] < 0 {
            cell.yieldLabel.textColor = .red
        } else {
            cell.yieldLabel.textColor = .green
        }
        cell.tickerLabel.text = exchanges[indexPath.row] + ": " + symbol[indexPath.row]
        cell.tickerLabel.textColor = .gray
        return cell
    }
    
}

