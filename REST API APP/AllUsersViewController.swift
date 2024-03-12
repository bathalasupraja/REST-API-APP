//
//  AllUsersViewController.swift
//  REST API APP
//
//  Created by Supraja on 05/03/24.
//

import UIKit

class AllUsersViewController: UIViewController {
    
    static func create() -> AllUsersViewController? {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllUsersViewController") as? AllUsersViewController
    }

    @IBOutlet weak var currentPageLabel: UILabel!
    @IBOutlet weak var currentPageDataLabel: UILabel!
    @IBOutlet weak var gotoPageLabel: UILabel!
    @IBOutlet weak var gotoPageTextField: UITextField!
    @IBOutlet weak var totalPagesLabel: UILabel!
    @IBOutlet weak var totalPagesDataLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usersTableView: UITableView!
    
    var users = [User]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        gotoPageTextField.delegate = self
        gotoPageTextField.keyboardType = .decimalPad
        title = "All users"
        fetchAllUsers()
        usersTableView.delegate = self
        usersTableView.dataSource = self
    }
    
    func fetchAllUsers() {
        activityIndicator.startAnimating()
        print("start fetching data.")
        WebServiceManager.shared.getAllUsers { users, pagination, error in
            DispatchQueue.main.async {
                self.users = users ?? []
                let currentPage = pagination?.page ?? 0
                self.currentPageDataLabel.text = "\(currentPage)"
                let totalPages = pagination?.pages ?? 0
                self.totalPagesDataLabel.text = "\(totalPages)"
                print(error ?? "?")
                print(pagination)
                print("data is reloading with \(self.users.count) item's")
                self.usersTableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
}

extension AllUsersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.id, for: indexPath)
        if let userCell = cell as? UserTableViewCell {
            let user = users[indexPath.row]
            userCell.prepareUser(user)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        94
    }
}

extension AllUsersViewController {
    @IBAction func didTouchCreate() {
        guard let controller = CreateUserViewController.create() else { return }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func didTouchGo() {
        print(gotoPageTextField.text)
        gotoPageTextField.resignFirstResponder()
    }
}

extension AllUsersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text)
    }
}
