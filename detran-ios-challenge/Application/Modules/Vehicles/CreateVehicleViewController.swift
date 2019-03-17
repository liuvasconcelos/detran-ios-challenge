//
//  CreateVehicleViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit

class CreateVehicleViewController: UIViewController, CreateVehicleViewContract {
    
    
    @IBOutlet weak var chassiLabel: UILabel!
    @IBOutlet weak var renavamLabel: UILabel!
    @IBOutlet weak var boardLabel: UILabel!
    @IBOutlet weak var repriceLabel: UILabel!
    @IBOutlet weak var modelYearLabel: UILabel!
    @IBOutlet weak var manufactureYearLabel: UILabel!
    @IBOutlet weak var ufGravameLabel: UILabel!
    
    @IBOutlet weak var chassi: UITextField!
    @IBOutlet weak var renavam: UITextField!
    @IBOutlet weak var board: UITextField!
    @IBOutlet weak var reprice: UITextField!
    @IBOutlet weak var modelYear: UITextField!
    @IBOutlet weak var manufactureYear: UITextField!
    @IBOutlet weak var ufGravame: UITextField!
    
    @IBOutlet weak var createVehicle: UIButton!
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    lazy var presenter: CreateVehiclePresenterContract = {
        return CreateVehiclePresenter(view: self,
                                      createContract: CreateContract(remoteDataSource: ContractRemoteDataSourceImpl.shared),
                                      getAuth: GetAuth(remoteDataSource: AuthenticationRemoteDataSourceImpl.shared),
                                      saveSession: SaveSession(localDataSource: SessionLocalDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = AppStrings.register_a_vehicle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setLabels()
    }
    
    fileprivate func setLabels() {
        chassiLabel.text          = AppStrings.chassi
        renavamLabel.text         = AppStrings.renavam
        boardLabel.text           = AppStrings.board
        repriceLabel.text         = AppStrings.reprice
        modelYearLabel.text       = AppStrings.model_year
        manufactureYearLabel.text = AppStrings.manufacture_year
        ufGravameLabel.text       = AppStrings.uf_gravame
        
        createVehicle.setTitle(AppStrings.register_a_vehicle, for: .normal)
    }
    
    @IBAction func sendFormToCreate(_ sender: Any) {
        presenter.sendFormToCreate(vehicle: ContractRequest(code: 0,
                                                            endUsersDocument: "35507907838",
                                                            personal: nil, contract: nil,
                                                            vehicle: Vehicle(chassis: chassi.text ?? "",
                                                                             renavam: renavam.text ?? "",
                                                                             ufBoard: board.text ?? "",
                                                                             reprice: reprice.text ?? "",
                                                                             modelYear: Int(modelYear.text ?? "0") ?? 0,
                                                                             manufactureYear: Int(manufactureYear.text ?? "0") ?? 0,
                                                                             ufGravameRegister: ufGravame.text ?? ""),
                                                            credor: nil))
    }
    
    func showSuccessAlert() {
        let alertController = UIAlertController(title: "", message: AppStrings.add_a_vehicle_success_message, preferredStyle: .alert)
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
        let alertController = UIAlertController(title: "", message: AppStrings.add_a_vehicle_error_message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

