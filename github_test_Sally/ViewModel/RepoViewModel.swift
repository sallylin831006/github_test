//
//  RepoViewModel.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation

class RepoViewModel {
    
    var repoData = Box([Repo]())

    private let userProvider = UserProvider()

    func fetchRepoData(userName: String) {
        
        userProvider.getRepo(userName: userName, completion: { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let repoData):
                
                self.repoData.value = repoData

            case .failure:
                print("失敗")
            }
        })
     
    }
    
  
    
}
