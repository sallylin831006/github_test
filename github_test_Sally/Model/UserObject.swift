//
//  UserObject.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation


struct User: Codable {
    var login: String
    var avatarUrl: String
    var siteAdmin: Bool
    var htmlUrl: String
    var reposUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case siteAdmin = "site_admin"
        case htmlUrl = "html_url"
        case reposUrl = "repos_url"
    }
}

struct Repo: Codable {
    var name: String
    var description: String?
    var stargazersCount: Int
    
    enum CodingKeys: String, CodingKey {
        
        case name, description
        case stargazersCount = "stargazers_count"
        
    }
    
    
}
