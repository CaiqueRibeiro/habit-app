//
//  WebService.swift
//  Habit
//
//  Created by Caique Ribeiro Rodrigues on 18/12/24.
//

import Foundation

enum WebService {
    enum Endpoint: String {
        case base = "https://habitplus-api.tiagoaguiar.co"
        case postUser = "/users"
    }

    private static func completeUrl(path: Endpoint) -> URLRequest? {
        guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)") else { return nil }
        return URLRequest(url: url)
    }
    
    static func postUser(fullName: String,
                         email: String,
                         password: String,
                         document:String,
                         phone: String,
                         birthday: String,
                         gender: Int) {
        let json: [String : Any] = [
            "name": fullName,
            "email": email,
            "password": password,
            "document": document,
            "phone": phone,
            "birthday": birthday,
            "gender": gender
        ]
        
        // Creates JSON from dictionary
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        guard var urlRequest = completeUrl(path: .postUser) else { return }
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        // Creates an asynchronous task to make request
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error)
                return
            }
            
            print(String(data: data, encoding: .utf8))
            
            print("response\n")
            
            print(response)
            
            if let r = response as? HTTPURLResponse {
                print(r.statusCode)
            }
        }
        
        task.resume()
    }
    
}
