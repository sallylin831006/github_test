//
//  HTTPClient.swift
//  github_test_Sally
//
//  Created by 林翊婷 on 2022/6/16.
//

import Foundation

enum Result<T> {

    case success(T)

    case failure(Error)
}

enum STHTTPClientError: Error {

    case decodeDataFail

    case clientError(Data)

    case serverError

    case unexpectedError
}

enum STHTTPMethod: String {

    case GET

    case POST
    
    case PATCH
    
    case DELETE
}

enum STHTTPHeaderField: String {

    case contentType = "Content-Type"

    case auth = "Authorization"
    
    case accept = "Accept"
}

enum STHTTPHeaderValue: String {

    case json = "application/json"
    
    case acceptJson = "application/vnd.github.v3+json"
}

protocol STRequest {

    var headers: [String: String] { get }

    var body: Data? { get }

    var method: String { get }

    var endPoint: String { get }
}

extension STRequest {
    
    func makeRequest(domain: String) -> URLRequest {
        
        let urlString = Bundle.STValueForString(key: domain) + endPoint
        
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!

        var request = URLRequest(url: url)

        request.allHTTPHeaderFields = headers
        
        request.httpBody = body

        request.httpMethod = method

        return request
    }
}

class HTTPClient {

    static let shared = HTTPClient()

    private let decoder = JSONDecoder()

    private let encoder = JSONEncoder()

    private init() { }

    
    func request(
        _ stRequest: STRequest,
        completion: @escaping (Result<Data>) -> Void
    ) {

        URLSession.shared.dataTask(
            with: stRequest.makeRequest(domain: Constant.gitHubDomain),
            completionHandler: { (data, response, error) in

            guard error == nil else {

                return completion(Result.failure(error!))
            }
                
            let httpResponse = response as! HTTPURLResponse

            let statusCode = httpResponse.statusCode
                print("STATUS CODE: \(httpResponse.statusCode),\(stRequest.method),\(stRequest.endPoint)")

            switch statusCode {

            case 200..<300:

                completion(Result.success(data!))

            case 400..<500:

                completion(Result.failure(STHTTPClientError.clientError(data!)))

            case 500..<600:

                completion(Result.failure(STHTTPClientError.serverError))

            default: return

                completion(Result.failure(STHTTPClientError.unexpectedError))
            }

        }).resume()
    }
    
}


extension Bundle {

    static func STValueForString(key: String) -> String {
        
        return Bundle.main.infoDictionary![key] as! String
    }

    static func STValueForInt32(key: String) -> Int32 {

        return Bundle.main.infoDictionary![key] as! Int32
    }
}
