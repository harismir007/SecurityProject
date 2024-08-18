//
//  NetworkClient.swift
//  GuardApp
//
//  Created by Haris on 18/08/2024.
//

import Foundation
import Alamofire

class Services{
    static var baseUrl = "http://127.0.0.1:8000/api/signin"
    
    static var signin = "signin"
    static var register = "register"
}



class NetworkClient {
    
    static let shared = NetworkClient()
    private init () { }
    
    func fetchGenericData<T: Decodable>(parameters: NSDictionary, service: String, completion: @escaping (T?, _ hasError: String?) -> ()) {
        
        AF.request("\(Services.baseUrl)\(service)", method: .post, parameters: parameters as? Parameters, headers: nil ).responseData{ (dataResponse) in
            
                switch(dataResponse.result){
                case .success:

                    guard let data = dataResponse.data  else {
                        completion(nil, "Response data is empty or nil.")
                        return
                    }
                    do {
                        let decodedObject = try JSONDecoder().decode(T.self, from: data)
                        completion(decodedObject, nil)
                    } catch let error as NSError {
                        print(error)
                        completion(nil, error.localizedDescription)
                    }
                    break
                case .failure(let error):
                    print("failure", error)
                    
                    completion(nil, "Our service seems to be inaccessible. Please check your internet connection and try again. We apologize for the inconvenience.")
                    break
                }
            }
    }
}
