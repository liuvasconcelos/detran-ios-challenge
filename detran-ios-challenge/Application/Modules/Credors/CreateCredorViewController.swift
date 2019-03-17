//
//  CreateCredorViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateCredorViewController: UIViewController, CreateCredorViewContract {
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var rgLabel: UILabel!
    @IBOutlet weak var ufLabel: UILabel!
    @IBOutlet weak var cepLabel: UILabel!
    @IBOutlet weak var neighborhoodLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var financedLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var institutionNameLabel: UILabel!
    @IBOutlet weak var complementLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var person: UITextField!
    @IBOutlet weak var rg: UITextField!
    @IBOutlet weak var uf: UITextField!
    @IBOutlet weak var cep: UITextField!
    @IBOutlet weak var neighborhood: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var financed: UITextField!
    @IBOutlet weak var addressNumber: UITextField!
    @IBOutlet weak var institutionName: UITextField!
    @IBOutlet weak var complement: UITextField!
    @IBOutlet weak var type: UITextField!
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    lazy var presenter: CreateCredorPresenterContract = {
        return CreateCredorPresenter(view: self,
                                     createContract: CreateContract(remoteDataSource: ContractRemoteDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cadastrar credor"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func sendFormToCreate(_ sender: Any) {
        presenter.sendFormToCreate(credor: ContractRequest(code: 0,
                                                           endUsersDocument: "35507907838",
                                                           personal: Personal(rg: rg.text ?? "",
                                                                              name: person.text ?? ""),
                                                           contract: nil,
                                                           vehicle: nil,
                                                           credor: Credor(uf: uf.text ?? "",
                                                                          cep: cep.text ?? "",
                                                                          type: type.text ?? "",
                                                                          neighborhood: neighborhood.text ?? "",
                                                                          address: address.text ?? "",
                                                                          phoneNumber: phoneNumber.text ?? "",
                                                                          city: city.text ?? "",
                                                                          financed: financed.text ?? "",
                                                                          addressNumber: Int(addressNumber.text ?? "0") ?? 0,
                                                                          financialInstituteName: institutionName.text ?? "",
                                                                          addressComplement: complement.text ?? "")))
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


