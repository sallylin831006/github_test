//
//  UserTableViewCell.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var adminStatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureLayoutCell(data: User) {
        
        userImageView.loadImage(data.avatarUrl)
        userNameLabel.text = data.login
        adminStatus.text = "siteAdmin: \(data.siteAdmin)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
