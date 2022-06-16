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
    
    var userData: User
    
    init(userData: User) {
        self.userData = userData
    }
    
    func fetchRepoData(userName: String) {
        
        let quene = DispatchQueue(label: "com.gitHub.Sallytest", attributes: .concurrent)
        
        quene.async {
            self.userProvider.getRepo(userName: userName, completion: { [weak self] result in
                
                guard let self = self else { return }
                
                switch result {
                    
                case .success(let repoData):
                    
                    self.repoData.value = repoData
                    
                case .failure:
                    ProgressHUD.showFailure(text: "讀取資料失敗")
                }
            })
            
        }
        
    }
   
}
