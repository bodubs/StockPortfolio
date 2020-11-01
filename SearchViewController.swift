//
//  SearchViewController.swift
//  StockPortforlio
//
//  Created by Bo Warren on 10/26/20.
//  Copyright © 2020 rpwarren. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var query: String?
    
    var resultSymbol = "--"
    var resultCompany = "--"
    var resultSharePrice = "--"
    
    @IBOutlet weak var SymbolLabel: UILabel!
    @IBOutlet weak var CompanyLabel: UILabel!
    @IBOutlet weak var SharePriceLabel: UILabel!
    @IBOutlet weak var SearchTextField: UITextField!
    @IBOutlet weak var OpenLabel: UILabel!
    @IBOutlet weak var HighLabel: UILabel!
    @IBOutlet weak var LowLabel: UILabel!
    @IBOutlet weak var YearHighLabel: UILabel!
    @IBOutlet weak var YearLowLabel: UILabel!
    @IBOutlet weak var VolumeLabel: UILabel!
    @IBOutlet weak var AvgVolLabel: UILabel!
    @IBOutlet weak var MktCapLabel: UILabel!
    @IBOutlet weak var PERatioLabel: UILabel!
    @IBOutlet weak var DivYieldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SymbolLabel.text = resultSymbol
        CompanyLabel.text = resultCompany
    }
    
    @IBAction func SearchButton(_ sender: Any) {
        if SearchTextField.text != nil {
            query = SearchTextField.text!.uppercased()
            let url = "https://cloud.iexapis.com/stable/stock/\(query!)/quote?token=pk_21a106b4469947acbf4ed39553f8bfe3"
            getData(from: url)
            print("Button was pressed")
            print(resultSymbol)
            SymbolLabel.text = resultSymbol
            CompanyLabel.text = resultCompany
        } else {
            SymbolLabel.text = ""
            CompanyLabel.text = ""
        }
    }
    
    @IBAction func BuyButton(_ sender: Any) {
    }
    @IBAction func SellButton(_ sender: Any) {
    }
    
    
    func getData(from url: String) {
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print(error!)
                return
            }
            
            // have data
            var result: SearchResult?
            do {
                result = try JSONDecoder().decode(SearchResult.self, from: data)
            } catch {
                print(error)
            }
            guard let json = result else {
                return
            }
            self.populateInfo(with: json)
            print(json.symbol!)
            print(json.companyName!)
            }).resume()
        
        
    }
    
    func populateInfo(with stockInfo: SearchResult) {
        resultSymbol = stockInfo.symbol
        resultCompany = stockInfo.companyName
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    struct SearchResult: Codable {
        let symbol: String!
        let companyName: String!
        let primaryExchange: String!
        let calculationPrice: String!
        let open: Double!
        let openTime: Double!
        let openSource: String!
        let close: Double!
        let closeTime: Double!
        let closeSource: String!
        let high: Double!
        let highTime: Double!
        let highSource: String!
        let low: Double!
        let lowTime: Double!
        let lowSource: String!
        let latestPrice: Double!
        let latestSource: String!
        let latestTime: String!
        let latestUpdate: Double!
        let latestVolume: Double!
        let iexRealtimePrice: Double!
        let iexRealtimeSize: Double!
        let iexLastUpdated: Double!
        let delayedPrice: Double!
        let delayedPriceTime: Double!
        let oddLotDelayedPrice: Double!
        let oddLotDelayedPriceTime: Double!
        let extendedPrice: Double!
        let extendedChange: Double!
        let extendedChangePercent: Double!
        let extendedPriceTime: Double!
        let previousClose: Double!
        let previousVolume: Double!
        let change: Double!
        let changePercent: Double!
        let volume: Double!
        let iexMarketPercent: Double!
        let iexVolume: Double!
        let avgTotalVolume: Double!
        let iexBidPrice: Double!
        let iexBidSize: Double!
        let iexAskPrice: Double!
        let iexAskSize: Double!
        let iexOpen: Bool!
        let iexOpenTime: Bool!
        let iexClose: Double!
        let iexCloseTime: Double!
        let marketCap: Double!
        let peRatio: Double!
        let week52High: Double!
        let week52Low: Double!
        let ytdChange: Double!
        let lastTradeTime: Double!
        let isUSMarketOpen: Bool!
    }

}
