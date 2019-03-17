//
//  ContractsListCell.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class  ContractsListCell: UITableViewCell {
    
    @IBOutlet weak var contractNumberLabel: UILabel!
    @IBOutlet weak var contractStatusImageView: UIImageView!
    @IBOutlet weak var detranStatusImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    public static let NIB_NAME   = "ContractsListCell"
    public static let IDENTIFIER = "ContractsListCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureViewFor(contract: Contract) {
        self.contractNumberLabel.text = "Número do contrato:"
        self.numberLabel.text         = "\(contract.code!)"
        
        if contract.status ?? false {
            self.contractStatusImageView.image = UIImage(named: "check")
        } else {
            self.contractStatusImageView.image = UIImage(named: "redcross")
        }
        
        if contract.detranStatus ?? false {
            self.detranStatusImageView.image = UIImage(named: "check")
        } else {
            self.detranStatusImageView.image = UIImage(named: "redcross")
        }
    }
    
}

