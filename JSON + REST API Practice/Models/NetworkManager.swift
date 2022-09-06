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
    
    func requestTrendyMovies(completion: @escaping(Trends) -> Void) {
     
        let request = AF.request("https://api.themoviedb.org/3/trending/all/day?api_key=<<api_key>>", method: .get)
        request.responseDecodable(of: Trends.self) { response in
            do {
                let data = try response.result.get()
                completion(data)
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
}
    
    func requestFromLocal(completion: @escaping(Company) -> Void) {
        guard let url = Bundle.main.url(forResource: "RawData", withExtension: "json") else{
            return
        }
        
        let request = AF.request(url, method: .get)
        request.responseDecodable(of: Company.self) { response in
            do {
                let data = try response.result.get()
                completion(data)
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
}
