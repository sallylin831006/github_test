//
//  ViewController.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel = UserViewModel()
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.dataSource = self
            
            tableView.delegate = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: UserTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: UserTableViewCell.self))
        
        dataBinding()
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchUserData()
    }
    
    private func dataBinding() {
        viewModel.userData.bind { [weak self] _ in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.userData.value.count
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: UserTableViewCell.self), for: indexPath)
                as? UserTableViewCell else { return UITableViewCell() }
        
        let item = viewModel.userData.value[indexPath.row]
        
        cell.configureLayoutCell(data: item)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailViewController = storyboard?.instantiateViewController(
            withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else { return }
        
        detailViewController.viewModel = RepoViewModel(userData: viewModel.userData.value[indexPath.row])
                
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
    
}
