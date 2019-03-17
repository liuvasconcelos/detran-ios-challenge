//
//  CreateVehicleViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateVehicleViewController: UIViewController, CreateVehicleViewContract {
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    lazy var presenter: CreateVehiclePresenterContract = {
        return CreateVehiclePresenter(view: self,
                                      createVehicle: CreateVehicle(remoteDataSource: ContractRemoteDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func sendFormToCreate(_ sender: Any) {
        presenter.sendFormToCreate(vehicle: ContractRequest(code: 7,
                                                            endUsersDocument: "35507907838",
                                                            personal: nil, contract: nil,
                                                            vehicle: Vehicle(chassis: "b",
                                                                             renavam: "b",
                                                                             ufBoard: "b",
                                                                             reprice: "b",
                                                                             modelYear: 2019,
                                                                             manufactureYear: 2019,
                                                                             ufGravameRegister: "b")))
    }
    
    func showSuccessAlert() {
        let alertController = UIAlertController(title: "", message: "Sucesso", preferredStyle: .alert)
        let okButton        = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction) in
            self.dismissViewController()
        }
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
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
        let alertController = UIAlertController(title: "", message: "Erro", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

