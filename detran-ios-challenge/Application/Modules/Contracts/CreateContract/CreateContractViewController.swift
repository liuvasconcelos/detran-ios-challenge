//
//  CreateContractViewController.swift
//  detran-ios-challenge
//
//  Created by Livia Vasconcelos on 17/03/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import UIKit
import YangMingShan

class CreateContractViewController: UIViewController, CreateContractViewContract {
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var rgLabel: UILabel!
    @IBOutlet weak var indexesLabel: UILabel!
    @IBOutlet weak var commissionLabel: UILabel!
    @IBOutlet weak var lateFeeLabel: UILabel!
    @IBOutlet weak var iofValueLabel: UILabel!
    @IBOutlet weak var mulctLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var gravameNumberLabel: UILabel!
    @IBOutlet weak var restrictionTypeLabel: UILabel!
    @IBOutlet weak var fineRateLabel: UILabel!
    @IBOutlet weak var lateFeeValueLabel: UILabel!
    @IBOutlet weak var contractDateLabel: UILabel!
    @IBOutlet weak var numberOfMonthsLabel: UILabel!
    @IBOutlet weak var fineRateValueLabel: UILabel!
    @IBOutlet weak var vendorDocumentTypeLabel: UILabel!
    @IBOutlet weak var commitionIndicationLabel: UILabel!
    @IBOutlet weak var contractNumberLabel: UILabel!
    @IBOutlet weak var recipientDocumentTypeLabel: UILabel!
    @IBOutlet weak var amountInterestPerYearLabel: UILabel!
    @IBOutlet weak var amountInterestPerMonthLabel: UILabel!
    @IBOutlet weak var mulctIndicationLabel: UILabel!
    @IBOutlet weak var vendorCpfCnpjLabel: UILabel!
    @IBOutlet weak var contractFeeValueLabel: UILabel!
    @IBOutlet weak var mainPaymentRecipientLabel: UILabel!
    @IBOutlet weak var mainPaymentRecipientCpfCnpjLabel: UILabel!
    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var rg: UITextField!
    @IBOutlet weak var indexes: UITextField!
    @IBOutlet weak var commition: UITextField!
    @IBOutlet weak var lateFee: UITextField!
    @IBOutlet weak var iofValue: UITextField!
    @IBOutlet weak var mulct: UITextField!
    @IBOutlet weak var comments: UITextField!
    @IBOutlet weak var gravameNumber: UITextField!
    @IBOutlet weak var restrictionType: UITextField!
    @IBOutlet weak var fineRate: UITextField!
    @IBOutlet weak var lateFeeValue: UITextField!
    @IBOutlet weak var contractDate: UITextField!
    @IBOutlet weak var quantityOfMonths: UITextField!
    @IBOutlet weak var fineRateValue: UITextField!
    @IBOutlet weak var vendorDocumentType: UITextField!
    @IBOutlet weak var commitionIndication: UITextField!
    @IBOutlet weak var contractNumber: UITextField!
    @IBOutlet weak var recipientDocumentType: UITextField!
    @IBOutlet weak var amountInterestPerYear: UITextField!
    @IBOutlet weak var amountInteresrPerMonth: UITextField!
    @IBOutlet weak var mulctIndication: UITextField!
    @IBOutlet weak var vendorCpfCnpj: UITextField!
    @IBOutlet weak var contractFeeValue: UITextField!
    @IBOutlet weak var mainPaymentRecipient: UITextField!
    @IBOutlet weak var mainPaymentRecipientCpfCnpj: UITextField!
    
    @IBOutlet weak var sendContractButton: UIButton!
    @IBOutlet weak var selectPhotosButton: UIButton!
    @IBOutlet weak var photosAmountLabel: UILabel!
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var imagesSelected = [UIImage]()

    lazy var presenter: CreateContractPresenterContract = {
        return CreateContractPresenter(view: self,
                                       createContract: CreateContract(remoteDataSource: ContractRemoteDataSourceImpl.shared),
                                       getAuth: GetAuth(remoteDataSource: AuthenticationRemoteDataSourceImpl.shared),
                                       saveSession: SaveSession(localDataSource: SessionLocalDataSourceImpl.shared))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = AppStrings.register_a_contract
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setLabels()
    }
    
    fileprivate func setLabels() {
        personNameLabel.text                  = AppStrings.personName
        rgLabel.text                          = AppStrings.rg
        indexesLabel.text                     = AppStrings.indexes
        commissionLabel.text                  = AppStrings.commition
        lateFeeLabel.text                     = AppStrings.late_fee
        iofValueLabel.text                    = AppStrings.iof_value
        mulctLabel.text                       = AppStrings.mulct
        commentsLabel.text                    = AppStrings.comments
        gravameNumberLabel.text               = AppStrings.gravame_number
        restrictionTypeLabel.text             = AppStrings.restriction_type
        fineRateLabel.text                    = AppStrings.fine_rate
        lateFeeValueLabel.text                = AppStrings.late_fee_value
        contractDateLabel.text                = AppStrings.contract_date
        numberOfMonthsLabel.text              = AppStrings.quantity_of_months
        fineRateValueLabel.text               = AppStrings.fine_rate_value
        vendorDocumentTypeLabel.text          = AppStrings.vendor_document_type
        commitionIndicationLabel.text         = AppStrings.commition_indication
        contractNumberLabel.text              = AppStrings.contract_number
        recipientDocumentTypeLabel.text       = AppStrings.recipient_document_type
        amountInterestPerYearLabel.text       = AppStrings.amount_interest_per_year
        amountInterestPerMonthLabel.text      = AppStrings.amount_interest_per_month
        mulctIndicationLabel.text             = AppStrings.mulct_indication
        vendorCpfCnpjLabel.text               = AppStrings.vendor_cpf_cnpj
        contractFeeValueLabel.text            = AppStrings.contract_fee_value
        mainPaymentRecipientLabel.text        = AppStrings.main_payment_recipient
        mainPaymentRecipientCpfCnpjLabel.text = AppStrings.main_payment_recipient_cpf_cnpj
        
        sendContractButton.setTitle(AppStrings.register_a_contract, for: .normal)
        photosAmountLabel.text = "\(AppStrings.amount_photos): \(self.imagesSelected.count)"
    }
    
    @IBAction func selectPhotos(_ sender: Any) {
        let pickerViewController = YMSPhotoPickerViewController.init()
        
        pickerViewController.numberOfPhotoToSelect = 10
        pickerViewController.theme.cameraIconColor = UIColor.orange
        pickerViewController.theme.cameraVeilColor = UIColor.clear
        pickerViewController.theme.orderTintColor  = UIColor.orange
        pickerViewController.theme.statusBarStyle  = .lightContent
        
        self.yms_presentCustomAlbumPhotoView(pickerViewController, delegate: self)
    }
    @IBAction func sendFormToCreate(_ sender: Any) {
        presenter.sendFormToCreate(contract: ContractRequest(code: 0,
                                                             endUsersDocument: "123456",
                                                             personal: Personal(rg: rg.text ?? "",
                                                                                name: personName.text ?? ""),
                                                             contract: InsideContract(indexes: indexes.text ?? "",
                                                                                      commission: Int(commition.text ?? "0") ?? 0,
                                                                                      lateFee: Int(lateFee.text ?? "0") ?? 0,
                                                                                      iofValue: Int(iofValue.text ?? "0") ?? 0,
                                                                                      mulct: Int(mulct.text ?? "0") ?? 0,
                                                                                      comments: comments.text ?? "",
                                                                                      gravameNumber: gravameNumber.text ?? "",
                                                                                      restrictionType: restrictionType.text ?? "",
                                                                                      fineRate: Int(fineRate.text ?? "0") ?? 0,
                                                                                      lateFeeValue: Int(lateFeeValue.text ?? "0") ?? 0,
                                                                                      contractDate: contractDate.text ?? "",
                                                                                      numberOfMonths: Int(quantityOfMonths.text ?? "0") ?? 0,
                                                                                      fineRateValue: Int(fineRateValue.text ?? "0") ?? 0,
                                                                                      vendorDocumentType: vendorDocumentType.text ?? "",
                                                                                      commitionIndication: commitionIndication.text ?? "",
                                                                                      contractNumber: contractNumber.text ?? "",
                                                                                      recipientDocumentType: recipientDocumentType.text ?? "",
                                                                                      amountOfInterestPerYear: Int(amountInterestPerYear.text ?? "0") ?? 0,
                                                                                      amountOfInterestPerMonth: Int(amountInteresrPerMonth.text ?? "0") ?? 0,
                                                                                      mulctIndication: mulctIndication.text ?? "",
                                                                                      vendorCpfCnpj: vendorCpfCnpj.text ?? "",
                                                                                      contractFeeValue: Int(contractFeeValue.text ?? "0") ?? 0,
                                                                                      mainRecipientPayment: mainPaymentRecipient.text ?? "",
                                                                                      mainRecipientCpfCnpj: mainPaymentRecipientCpfCnpj.text ?? ""),
                                                             vehicle: nil,
                                                             credor: nil),
                                   photos: self.imagesSelected)
    }
    
    func showSuccessAlert(successPhotos: [String], failPhotos: [String]) {
        let successPhotosSent = "\(AppStrings.image_sent): \(successPhotos.count)"

        let failPhotosSent = "\(AppStrings.image_fail): \(failPhotos.count)"

        let alertController = UIAlertController(title: AppStrings.add_a_contract_success_message, message: "\(successPhotosSent)\n\(failPhotosSent)", preferredStyle: .alert)
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
        let alertController = UIAlertController(title: "", message: AppStrings.add_a_contract_error_message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
