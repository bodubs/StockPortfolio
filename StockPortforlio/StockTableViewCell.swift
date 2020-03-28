//
//  StockTableViewCell.swift
//  StockPortforlio
//
//  Created by Bo Warren on 3/25/20.
//  Copyright © 2020 rpwarren. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var yieldLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
