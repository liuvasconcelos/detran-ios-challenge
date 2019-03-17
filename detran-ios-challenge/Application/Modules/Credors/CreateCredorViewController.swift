//
//  CreateCredorViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateCredorViewController: UIViewController, CreateCredorViewContract {
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    lazy var presenter: CreateCredorPresenterContract = {
        return CreateCredorPresenter(view: self,
                                     createContract: CreateContract(remoteDataSource: ContractRemoteDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func sendFormToCreate(_ sender: Any) {
        presenter.sendFormToCreate(credor: ContractRequest(code: 100,
                                                           endUsersDocument: "35507907838",
                                                           personal: Personal(rg: "aaa",
                                                                              name: "aaaa"),
                                                           contract: nil,
                                                           vehicle: nil,
                                                           credor: Credor(uf: "c",
                                                                          cep: "c",
                                                                          type: "c",
                                                                          neighborhood: "c",
                                                                          address: "c",
                                                                          phoneNumber: "c",
                                                                          city: "c",
                                                                          financed: "c",
                                                                          addressNumber: 1,
                                                                          financialInstituteName: "c",
                                                                          addressComplement: "c")))
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


