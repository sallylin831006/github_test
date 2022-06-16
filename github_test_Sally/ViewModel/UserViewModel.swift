//
//  UserViewModel.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation

class UserViewModel {
    
    var userData = Box([User]())
    
//    init() {
//      changeLocation(to: Self.defaultAddress)
//    }
    
    
    func fetchUserData() {

        let userProvider = UserProvider()
        
        userProvider.getUserList(completion: { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let usersListData):
                
                self.userData.value = usersListData
                
            case .failure:
                print("失敗")
//                ProgressHUD.showFailure(text: "讀取失敗")
            }
        })
     
    }
    
  
    
}
