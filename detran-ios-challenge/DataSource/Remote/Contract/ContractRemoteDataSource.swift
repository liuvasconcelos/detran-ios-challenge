//
//  ContractRemoteDataSource.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

public protocol ContractRemoteDataSource: class {
    func loadContracts(_ callback: @escaping (BaseCallback<[Contract]>) -> Void)
    func sendFormToCreate(contract: ContractRequest, _ callback: @escaping (BaseCallback<Contract>) -> Void)
    func sendPhoto(photo: UIImage, _ callback: @escaping (BaseCallback<String>) -> Void)
}
