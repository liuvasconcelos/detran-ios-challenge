//
//  HomeViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewContract {
    
    @IBOutlet weak var seeAllContractsButton: UIButton!
    @IBOutlet weak var addAContractButton: UIButton!
    @IBOutlet weak var addAVehicleButton: UIButton!
    @IBOutlet weak var addACreditorButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    lazy var presenter: HomePresenterContract = {
        return HomePresenter(view: self,
                             destroySession: DestroySession(localDataSource: SessionLocalDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func goToContractsListScreen(_ sender: Any) {
        let contractsListViewController = ContractsListViewController.fromNib().or(ContractsListViewController())
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(contractsListViewController, animated: true)
    }
    
    @IBAction func goToAddContractScreen(_ sender: Any) {
        let createContractViewController = CreateContractViewController.fromNib().or(CreateContractViewController())
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(createContractViewController, animated: true)
    }
    
    @IBAction func goToAddVehicleScreen(_ sender: Any) {
        let createVehicleViewController = CreateVehicleViewController.fromNib().or(CreateVehicleViewController())
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(createVehicleViewController, animated: true)
    }
    
    @IBAction func goToAddCreditorScreen(_ sender: Any) {
    }
    
    @IBAction func logout(_ sender: Any) {
        self.presenter.logout()
    }
    
    func didDestroySessionSuccess() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
