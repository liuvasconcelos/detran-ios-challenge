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
                                      getContract: GetContract(remoteDataSource: ContractRemoteDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contractsTableView.viewContract = self
        
        self.navigationItem.title = "Contratos"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.presenter.loadContracts()
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
        let alertController = UIAlertController(title: "", message: "Fail", preferredStyle: .alert)
        
        let reload = UIAlertAction(title: "Reload", style: .default) { (action:UIAlertAction) in
            self.hideLoader()
            self.presenter.loadContracts()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            self.dismissViewController()
        }
        
        alertController.addAction(reload)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showEmptyMessage() {
        let alertController = UIAlertController(title: "", message: "Empty", preferredStyle: .alert)
        
        let back = UIAlertAction(title: "Back to home", style: .cancel) { (action:UIAlertAction) in
            self.dismissViewController()
        }
        
        alertController.addAction(back)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
    }

}
