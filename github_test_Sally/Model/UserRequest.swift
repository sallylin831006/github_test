//
//  UserRequest.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation

enum UserRequest: STRequest {
    
    case getUserList(token: String)
    
    var headers: [String: String] {
        
        switch self {
            
        case .getUserList(let token):
            
            return [
                STHTTPHeaderField.auth.rawValue: "token \(token)",
                STHTTPHeaderField.accept.rawValue: STHTTPHeaderValue.acceptJson.rawValue
            ]
        }
    }
    
    var body: Data? {
        
        switch self {
            
        case .getUserList: return nil
        
        }
        
    }
    var method: String {
        
        switch self {
            
        case .getUserList : return STHTTPMethod.GET.rawValue
        
        }
    }
    
    var endPoint: String {
        
        switch self {
            
        case .getUserList:
            return "/users"
            
        }
        
    }
}
