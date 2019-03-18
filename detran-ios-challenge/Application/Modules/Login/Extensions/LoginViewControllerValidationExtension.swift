//
//  LoginViewControllerValidationExtension.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 16/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit
import SwiftValidator

extension LoginViewController: ValidationDelegate {
    
    func validationSuccessful() {
        presenter.login(financialsCode: 1001,
                        userName: userNameTextField.text ?? "",
                        password: passwordTextField.text ?? "")
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        self.hideLoader()
        for (field, error) in errors {
            if let field = field as? UITextField {
                field.text        = ""
                field.attributedPlaceholder = NSAttributedString(string: "\(error.errorMessage)",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                
            }
        }
    }
    
}

