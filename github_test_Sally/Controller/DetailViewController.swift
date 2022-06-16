//
//  DetailViewController.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    private let viewModel = RepoViewModel()
    
    var userData: User?
    
    
    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.dataSource = self
            
            tableView.delegate = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: DetailUserTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DetailUserTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: RepoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RepoTableViewCell.self))
        
        dataBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchRepoData(userName: userData?.login ?? "")
        
    }
    
    private func dataBinding() {
        viewModel.repoData.bind { [weak self] test in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
}

enum TableViewSecction : Int, CaseIterable {
    case user = 0
    case repos = 1
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = TableViewSecction(rawValue: section)
        
        switch section {
            
        case .user :
            return 1
            
        case .repos :
            print("viewModel.repoData.value.count",viewModel.repoData.value.count)
            return viewModel.repoData.value.count
            
        case .none:
            return 1 ///????????????
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = TableViewSecction(rawValue: indexPath.section)
        
        switch row {
            
        case .user :
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: DetailUserTableViewCell.self), for: indexPath)
                    as? DetailUserTableViewCell else { return UITableViewCell() }
            
            guard let item = userData else { return UITableViewCell() }
            
            cell.configureLayoutCell(data: item)
            
            return cell
            
        case .repos :
            
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: RepoTableViewCell.self), for: indexPath)
                    as? RepoTableViewCell else { return UITableViewCell() }
            
            let item = viewModel.repoData.value[indexPath.row]
            
            cell.configureLayoutCell(data: item)
            
            return cell
            
        case .none:
            
            return UITableViewCell()
        }
        
    }
    
}
