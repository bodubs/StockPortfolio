//
//  InputViewController.swift
//  StockPortforlio
//
//  Created by Bo Warren on 3/27/20.
//  Copyright © 2020 rpwarren. All rights reserved.
//

protocol StockDelegate {
    func addStock(stock: Stock)
    func removeStock(at index: Int)
}

import UIKit

class InputViewController: UIViewController {
    
    
    var stock: Stock?
    
    var index: Int?
    
    var delegate: StockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Security"
        
        populate()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashButtonTapped))
        Toolbar.setItems([spacer, trashButton], animated: true)

        // Do any additional setup after loading the view.
    }
    
    @objc func trashButtonTapped() {
        guard let stock = stock else {
            return
        }
        let ac = UIAlertController(title: "Remove \(stock.name) from portfolio?", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Remove", style: .default, handler: { (_) in
            if let delegate = self.delegate {
                if let stock = self.stock {
                    if let index = self.index {
                        delegate.removeStock(at: index)
                    }
                }
            }
            self.navigationController?.popViewController(animated: true)
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(ac, animated: true)
        
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var boughtAtLabel: UILabel!
    @IBOutlet weak var marketPriceLabel: UILabel!
    @IBOutlet weak var numSharesLabel: UILabel!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var tickerTxtField: UITextField!
    @IBOutlet weak var exchangeTxtField: UITextField!
    @IBOutlet weak var boughtAtTxtField: UITextField!
    @IBOutlet weak var marketPriceTxtField: UITextField!
    @IBOutlet weak var numSharesTxtField: UITextField!
    
    @IBOutlet weak var SearchButton: UIButton!
    
    @IBOutlet weak var Toolbar: UIToolbar!
    
    @IBAction func saveButton(_ sender: Any) {
        if nameTxtField.text != nil && tickerTxtField.text != nil && exchangeTxtField.text != nil && boughtAtTxtField.text != nil && marketPriceLabel.text != nil && numSharesTxtField.text != nil {
            if let yield = getYield(marketPrice: marketPriceTxtField.text!, bookPrice: boughtAtTxtField.text!) {
                let newStock = Stock(name: nameTxtField.text!, bookPrice: boughtAtTxtField.text!, marketPrice: marketPriceTxtField.text!, exchange: exchangeTxtField.text!, symbol: tickerTxtField.text!)
                if let delegate = delegate {
                    delegate.addStock(stock: newStock)
                }
            }
        }
    }
    
    func getYield (marketPrice: String, bookPrice: String) -> Double? {
        guard let marketPriceDouble = Double(marketPrice) else { return nil }
        guard let bookPriceDouble = Double(bookPrice) else { return nil}
//        let bookPriceDouble = Double(bookPrice)
        print(marketPriceDouble)
        print(bookPriceDouble)
        print(((marketPriceDouble/bookPriceDouble) - 1) * 100)
        return (((marketPriceDouble/bookPriceDouble) - 1) * 100)
    }
    
    func populate() {
        if self.stock != nil {
            nameTxtField.text = stock!.name
            tickerTxtField.text = stock!.symbol
            exchangeTxtField.text = stock!.exchange
            boughtAtTxtField.text = "\(stock!.bookPrice)"
            marketPriceTxtField.text = "\(stock!.marketPrice)"
            
        }
    }
    

}
