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
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case siteAdmin = "site_admin"
    }
}
