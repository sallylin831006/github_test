//
//  ViewController.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import UIKit

class ViewController: UIViewController {
    
    var userData: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.dataSource = self
            
            tableView.delegate = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: UserTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: UserTableViewCell.self))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    // MARK: - GET Friends List
    private func fetchData() {
        let userProvider = UserProvider()
        
        userProvider.getUserList(completion: { [weak self] result in
            
            switch result {
                
            case .success(let usersListData):
                
                print("usersListData", usersListData)
                
                self?.userData = usersListData
                
            case .failure:
                print("失敗")
//                ProgressHUD.showFailure(text: "讀取失敗")
            }
        })
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        userData.count
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: UserTableViewCell.self), for: indexPath)
                as? UserTableViewCell else { return UITableViewCell() }
        
                
        let item = userData[indexPath.row]
        
        cell.configureLayoutCell(data: item)
        
        return cell
        
    }
    
    
    
}
