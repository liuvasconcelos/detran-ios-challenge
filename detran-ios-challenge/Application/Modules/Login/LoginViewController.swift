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
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var chooseStatePickerView: UIPickerView!
    @IBOutlet weak var detranIdentifier: UITextField!
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    let validator = Validator()
    let states = ["Detran Ceará", "Detran Rio de Janeiro"]
    
    lazy var presenter: LoginPresenterContract = {
        return LoginPresenter(view: self,
                              getAuth: GetAuth(remoteDataSource: AuthenticationRemoteDataSourceImpl.shared),
                              saveSession: SaveSession(localDataSource: SessionLocalDataSourceImpl.shared),
                              getUserSession: GetUserSession(localDataSource: SessionLocalDataSourceImpl.shared))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerFieldsToValidate()
        self.setIdentifiers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        self.chooseStatePickerView.isHidden   = true
        self.chooseStatePickerView.delegate   = self
        self.chooseStatePickerView.dataSource = self
        
        self.detranIdentifier.placeholder  = states.first
        self.userNameTextField.placeholder = AppStrings.username
        self.passwordTextField.placeholder = AppStrings.password
        self.loginButton.setTitle(AppStrings.login, for: .normal)
        
        if presenter.isUserLogged() {
            self.goToHomeScreen()
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    fileprivate func setIdentifiers() {
        self.loginButton.accessibilityIdentifier       = "loginButton"
        self.userNameTextField.accessibilityIdentifier = "usernameTextField"
        self.passwordTextField.accessibilityIdentifier = "passwordTextField"
    }
    
    @IBAction func login(_ sender: Any) {
        validator.validate(self)
    }
    
    @IBAction func selectState(_ sender: Any) {
        chooseStatePickerView.isHidden = false
    }
    
    private func registerFieldsToValidate() {
        validator.registerField(userNameTextField, rules: [RequiredRule(message: AppStrings.required_field)])
        validator.registerField(passwordTextField, rules: [RequiredRule(message: AppStrings.required_field)])
    }
    
    func loginSuccessful() {
        self.goToHomeScreen()
    }
    
    fileprivate func goToHomeScreen() {
        let homeViewController = HomeViewController.fromNib().or(HomeViewController())
    
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(homeViewController, animated: true)
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

