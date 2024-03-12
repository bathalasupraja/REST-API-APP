//
//  ViewController.swift
//  REST API APP
//
//  Created by Supraja on 18/02/24.
//

import UIKit

protocol CreateUserActionDelegate: AnyObject {
    func didTouchCreateUserAction()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var userDetailsButton: UIButton!
    @IBOutlet weak var createUserButton: UIButton!
    @IBOutlet weak var allUsersButton: UIButton!
    

    weak var delegate: CreateUserActionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsButton.layer.cornerRadius = 15
        userDetailsButton.layer.masksToBounds = true
        createUserButton.layer.cornerRadius = 15
        createUserButton.layer.masksToBounds = true
    }

    @IBAction func didTouchCreateUserAction() {
        delegate?.didTouchCreateUserAction()
        
        let webService = WebServiceManager.shared
        
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "CreateUserViewController") as! CreateUserViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    @IBAction func didTouchShowAllUsersAction() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "AllUsersViewController") as! AllUsersViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

