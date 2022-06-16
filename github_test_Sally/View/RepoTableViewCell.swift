//
//  RepoTableViewCell.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var starNumerLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureLayoutCell(data: Repo) {
        repoName.text = data.name
        descriptionLabel.text = data.description
        starNumerLabel.text = String(data.stargazersCount)

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
