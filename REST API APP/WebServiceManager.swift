//
//  WebServiceManager.swift
//  REST API APP
//
//  Created by Supraja on 05/03/24.
//

import Foundation
import UIKit

enum UserStatusEnum: String {
    case active = "active", inactive = "inactive"
    
    var backgroundColor: UIColor {
        switch self {
        case .active: /// 124, 252, 197
            return UIColor(red: 124/255, green: 252/255, blue: 197/255, alpha: 0.1)
        case .inactive: /// 250, 242, 132
            return UIColor(red: 250/255, green: 242/255, blue: 132/255, alpha: 0.1)
        }
    }
}

struct User: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var gender: String?
    var status: String?
}

struct UserResponseModel: Codable {
    var code: Int?
    var data: [User]?
    var meta: MetaDataModel?
}

struct PaginationModel: Codable {
    var total: Int?
    var pages: Int?
    var page: Int?
    var limit: Int?
}

struct MetaDataModel: Codable {
    var pagination: PaginationModel?
}

/// Singleton or Shared Instance
class WebServiceManager {
    
    /// Create once in memory and available till the app is closed.
    static let shared = WebServiceManager()
    
    private init() {
        
    }
    
    func createUser(_ username: String, email: String, gender: String) {
        
    }
    
    func getUserWithUser(id: String) -> User? {
        return nil
    }
    
    /// Get All Available Users.
    /// - returns: completion with available users and error if exist.
    func getAllUsers(completion: @escaping([User]?, PaginationModel?, String?) -> ()) {
        guard let url = URL(string: "https://gorest.co.in/public-api/users") else {
            completion(nil, nil, "Unable to create URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data else {
                print(error ?? "Unknown error")
                completion(nil, nil, error?.localizedDescription)
                return
            }
            do {
                let response = try JSONDecoder().decode(UserResponseModel.self, from: data)
                completion(response.data, response.meta?.pagination, nil)
            } catch {
                print(error.localizedDescription)
                completion(nil, nil, error.localizedDescription)
            }
        }
        task.resume()
    }
}
