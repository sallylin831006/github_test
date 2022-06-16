//
//  DetailViewController.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: RepoViewModel?
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.dataSource = self
            
            tableView.delegate = self
            
        }
    }
    
    enum TableViewSecction : Int, CaseIterable {
        case user = 0
        case repos = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: DetailUserTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DetailUserTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: RepoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RepoTableViewCell.self))
        
        dataBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let userName = viewModel?.userData.login else { return }
        viewModel?.fetchRepoData(userName: userName)
        
    }
    
    private func dataBinding() {
        viewModel?.repoData.bind { [weak self] test in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = TableViewSecction(rawValue: section),
              let viewModel = viewModel else { return 0 }
        
        switch section {
            
        case .user :
            return 1
            
        case .repos :
            return viewModel.repoData.value.count
            
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = TableViewSecction(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch row {
            
        case .user :
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: DetailUserTableViewCell.self), for: indexPath)
                    as? DetailUserTableViewCell else { return UITableViewCell() }
            
            guard let item = viewModel?.userData else { return UITableViewCell() }
            
            cell.configureLayoutCell(data: item)
            
            return cell
            
        case .repos :
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: RepoTableViewCell.self), for: indexPath)
                    as? RepoTableViewCell else { return UITableViewCell() }
            
            guard let viewModel = viewModel else { return UITableViewCell() }
            
            let item = viewModel.repoData.value[indexPath.row]
            
            cell.configureLayoutCell(data: item)
            
            return cell
            
        }
        
    }
    
}
