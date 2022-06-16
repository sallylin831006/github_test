//
//  UserViewModel.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation

class UserViewModel {
    
    var userData = Box([User]())
    
    private let userProvider = UserProvider()
    
    func fetchUserData() {

        userProvider.getUserList(completion: { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let usersListData):
                
                self.userData.value = usersListData
                
            case .failure:
                ProgressHUD.showFailure(text: "讀取資料失敗")
            }
        })
     
    }
    
}
