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
        self.open(viewController: ContractsListViewController.fromNib().or(ContractsListViewController()))
    }
    
    @IBAction func goToAddContractScreen(_ sender: Any) {
        self.open(viewController: CreateContractViewController.fromNib().or(CreateContractViewController()))
    }
    
    @IBAction func goToAddVehicleScreen(_ sender: Any) {
        self.open(viewController: CreateVehicleViewController.fromNib().or(CreateVehicleViewController()))
    }
    
    @IBAction func goToAddCreditorScreen(_ sender: Any) {
        self.open(viewController: CreateCredorViewController.fromNib().or(CreateCredorViewController()))
    }
    
    fileprivate func open(viewController: UIViewController) {
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        self.presenter.logout()
    }
    
    func didDestroySessionSuccess() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
