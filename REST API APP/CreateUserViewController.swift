//
//  CreateUserViewController.swift
//  REST API APP
//
//  Created by Supraja on 18/02/24.
//

import UIKit


class CreateUserViewController: UIViewController {
    
    static func create() -> CreateUserViewController? {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateUserViewController") as? CreateUserViewController
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create User"
        prepareInterface()
    }
    
    private func prepareInterface() {
        let createButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(didTocuhCreate))
//        let clearButton = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(didTocuhCreate))
//        createButton.tintColor = .red
//        navigationItem.rightBarButtonItems = [createButton, clearButton]
        navigationItem.rightBarButtonItem = createButton
    }
    
    @objc func didTocuhCreate() {
        print("did touch create: name = \(nameTextField.text ?? "-")\nemail = \(emailTextField.text ?? "-")\ngender = \(genderTextField.text ?? "-")")
        let webService = WebServiceManager.shared
    }
    
}
