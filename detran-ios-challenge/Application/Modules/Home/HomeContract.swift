//
//  HomeContract.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

protocol HomeViewContract {
    func didDestroySessionSuccess()
}

protocol HomePresenterContract {
    func logout()
}
