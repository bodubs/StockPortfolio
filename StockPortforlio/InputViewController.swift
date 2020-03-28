//
//  InputViewController.swift
//  StockPortforlio
//
//  Created by Bo Warren on 3/27/20.
//  Copyright © 2020 rpwarren. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashButtonTapped))
        Toolbar.setItems([spacer, trashButton], animated: true)

        // Do any additional setup after loading the view.
    }
    
    @objc func trashButtonTapped() {
        
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
    
    
    @IBOutlet weak var Toolbar: UIToolbar!
    

}
