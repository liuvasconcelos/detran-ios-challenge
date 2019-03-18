//
//  ContractsListViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class ContractsListViewController: UIViewController , ContractsListViewContract {
    
    @IBOutlet weak var contractsTableView: ContractsListTableView!
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    lazy var presenter: ContractsListPresenterContract = {
        return ContractsListPresenter(view: self,
                                      getContract: GetContract(remoteDataSource: ContractRemoteDataSourceImpl.shared),
                                      getAuth: GetAuth(remoteDataSource: AuthenticationRemoteDataSourceImpl.shared),
                                      saveSession: SaveSession(localDataSource: SessionLocalDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setIdentifiers()
        contractsTableView.viewContract = self
        
        self.navigationItem.title = AppStrings.contracts
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.presenter.loadContracts()
    }
    
    fileprivate func setIdentifiers() {
        contractsTableView.accessibilityIdentifier = "contractsTableView"
    }
    
    func show(contracts: [Contract]) {
        DispatchQueue.main.async {
            self.contractsTableView.set(contracts: contracts)
            self.contractsTableView.reloadData()
        }
    }
    
    func showLoader() {
        loader.center           = self.view.center
        loader.hidesWhenStopped = true
        loader.style            = UIActivityIndicatorView.Style.gray
        
        self.view.addSubview(loader)
        loader.startAnimating()
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
        }
    }
    
    func showError() {
        let alertController = UIAlertController(title: "", message: AppStrings.contract_list_error_message, preferredStyle: .alert)
        
        let reload = UIAlertAction(title: AppStrings.reload, style: .default) { (action:UIAlertAction) in
            self.hideLoader()
            self.presenter.loadContracts()
        }
        
        let cancel = UIAlertAction(title: AppStrings.cancel, style: .cancel) { (action:UIAlertAction) in
            self.dismissViewController()
        }
        
        alertController.addAction(reload)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showEmptyMessage() {
        let alertController = UIAlertController(title: "", message: AppStrings.contract_list_empty_message, preferredStyle: .alert)
        
        let back = UIAlertAction(title: AppStrings.back, style: .cancel) { (action:UIAlertAction) in
            self.dismissViewController()
        }
        
        alertController.addAction(back)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
    }

}
