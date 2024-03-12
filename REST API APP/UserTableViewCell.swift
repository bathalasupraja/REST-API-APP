//
//  UserTableViewCell.swift
//  REST API APP
//
//  Created by Supraja on 05/03/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let id = "UserTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameDataLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailDataLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var idDataLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderDataLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusDataLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepareUser(_ user: User) {
        nameDataLabel.text = user.name
        emailDataLabel.text = user.email
        idDataLabel.text = "\(user.id ?? -0)"
        genderDataLabel.text = user.gender
        statusDataLabel.text = user.status
        if let statusText = user.status, let status = UserStatusEnum(rawValue: statusText) {
            contentView.backgroundColor = status.backgroundColor
        }
    }
}
