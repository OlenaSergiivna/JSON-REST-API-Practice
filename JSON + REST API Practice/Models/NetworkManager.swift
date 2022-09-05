//
//  File.swift
//  JSON + REST API Practice
//
//  Created by user on 06.09.2022.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func requestDeviceData(completion: @escaping(Company) -> Void) {
        //
    }
    
    func requestFromLocal(completion: @escaping([Device?]) -> Void) {
        guard let url = Bundle.main.url(forResource: "RawData", withExtension: "json") else{
            return
        }
        
     
            let request = AF.request(url, method: .get)
            request.responseDecodable(of: Company.self) { response in
                
                do {
                    let data = try response.result.get().listOfData
                   completion(data)
                } catch {
                    
                }
                
        }
        
        
    }
}
