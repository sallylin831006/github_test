//
//  UserProvider.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation

import UIKit

typealias UserHanlder = (Result<[User]>) -> Void

class UserProvider {
    
    let decoder = JSONDecoder()
    
    // MARK: - GET Friend List
    func getUserList(completion: @escaping UserHanlder) {
        
//        guard let token = KeyChainManager.shared.token else {
//            return completion(Result.failure(FunTravelerSignInError.noToken))
//        }
        
        let token = KeyConstant.gitHubtoken
        
        
        HTTPClient.shared.request(UserRequest.getUserList(token: token), completion: { result in
            
            switch result {
                
            case .success(let data):
                
                do {
                    let usersResponse = try JSONDecoder().decode([User].self, from: data
                    )
                    
                    DispatchQueue.main.async {
                        completion(Result.success(usersResponse))
                    }
                    
                } catch {
                    print(error)
                    completion(Result.failure(error))
                }
                
            case .failure(let error):
                print(error)
                completion(Result.failure(error))
                
            }
        })
    }
    
}
