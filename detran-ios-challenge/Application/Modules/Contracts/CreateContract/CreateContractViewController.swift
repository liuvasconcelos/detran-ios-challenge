//
//  CreateContractViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateContractViewController: UIViewController, CreateContractViewContract {
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()

    lazy var presenter: CreateContractPresenterContract = {
        return CreateContractPresenter(view: self,
                                       createContract: CreateContract(remoteDataSource: ContractRemoteDataSourceImpl.shared))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func sendFormToCreate(_ sender: Any) {
        presenter.sendFormToCreate(contract: ContractRequest(code: 789,
                                                             endUsersDocument: "123456",
                                                             personal: Personal(rg: "H73839K", name: "Teste Livia"),
                                                             contract: InsideContract(indexes: "a",
                                                                                      commission: 1,
                                                                                      lateFee: 1,
                                                                                      iofValue: 1,
                                                                                      mulct: 1,
                                                                                      comments: "a",
                                                                                      gravameNumber: "a",
                                                                                      restrictionType: "a",
                                                                                      fineRate: 1,
                                                                                      lateFeeValue: 1,
                                                                                      contractDate: "a",
                                                                                      numberOfMonths: 1,
                                                                                      fineRateValue: 1,
                                                                                      vendorDocumentType: "a",
                                                                                      commitionIndication: "a",
                                                                                      contractNumber: "a",
                                                                                      recipientDocumentType: "a",
                                                                                      amountOfInterestPerYear: 1,
                                                                                      amountOfInterestPerMonth: 1,
                                                                                      mulctIndication: "a",
                                                                                      vendorCpfCnpj: "a",
                                                                                      contractFeeValue: 1,
                                                                                      mainRecipientPayment: "a",
                                                                                      mainRecipientCpfCnpj: "a"),
                                                             vehicle: nil))
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
