//
//  ContractsListTableView.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class  ContractsListTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var contracts = [Contract]()
    var viewContract: ContractsListViewContract?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate                 = self
        self.dataSource               = self
        self.separatorStyle           = .singleLine
        self.isScrollEnabled          = true
        self.isUserInteractionEnabled = true

        let cell = UINib(nibName: ContractsListCell.NIB_NAME, bundle: nil)
        self.register(cell, forCellReuseIdentifier: ContractsListCell.IDENTIFIER)
    }

    func set(contracts: [Contract]) {
        self.contracts = contracts
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contracts.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractsListCell.IDENTIFIER) as? ContractsListCell else {
            return ContractsListCell()
        }
        cell.isUserInteractionEnabled = false
        cell.configureViewFor(contract: contracts[indexPath.row])

        return cell
    }

}
