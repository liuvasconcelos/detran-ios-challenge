//
//  LoginViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit
import SwiftValidator

class LoginViewController: UIViewController, LoginViewContract {
    
    @IBOutlet weak var detranIdentifierTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    let validator = Validator()
    
    lazy var presenter: LoginPresenterContract = {
        return LoginPresenter(view: self,
                              getAuth: GetAuth(remoteDataSource: AuthenticationRemoteDataSourceImpl.shared),
                              saveSession: SaveSession(localDataSource: SessionLocalDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerFieldsToValidate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func login(_ sender: Any) {
        validator.validate(self)
    }
    
    private func registerFieldsToValidate() {
        validator.registerField(detranIdentifierTextField, rules: [RequiredRule(message: "Required field"), FloatRule(message: "Has to be a number")])
        validator.registerField(userNameTextField, rules: [RequiredRule(message: "Required field")])
        validator.registerField(passwordTextField, rules: [RequiredRule(message: "Required field")])
    }
    
    func loginSuccessful() {
        print("success")
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
    
    func show(error: String) {
        let alertController = UIAlertController(title: "", message: error, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

