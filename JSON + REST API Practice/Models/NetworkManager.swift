//
//  File.swift
//  JSON + REST API Practice
//
//  Created by user on 06.09.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func requestTrendyMovies(page: Int, completion: @escaping([Movie]) -> Void) {
        
        let url = "https://api.themoviedb.org/3/trending/all/day?api_key=b718f4e2921daaf000e347114cf44187&page=\(page)"
        
        let request = AF.request(url, method: .get)
        
        
        request.responseDecodable(of: Trends.self) { response in
            

            do {
                let data = try response.result.get().results
                completion(data)
                
                
            } catch {
                print(error.localizedDescription)
                
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
    
    
    func requestMovieGenres(completion: @escaping([Genre]) -> Void) {
     
        let request = AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=b718f4e2921daaf000e347114cf44187&language=en-US", method: .get)
        
        request.responseDecodable(of: Genres.self) { response in
            do {
                let data = try response.result.get().genres
                completion(data)
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
    
    
    func requestTVGenres(completion: @escaping([Genre]) -> Void) {
     
        let request = AF.request("https://api.themoviedb.org/3/genre/tv/list?api_key=b718f4e2921daaf000e347114cf44187&language=en-US", method: .get)
        
        request.responseDecodable(of: Genres.self) { response in
            do {
                let data = try response.result.get().genres
                completion(data)
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
}


func getNewMovies(page: Int, completion: @escaping([Movie]) -> Void) {
    
    let url = "https://api.themoviedb.org/3/trending/all/day?api_key=b718f4e2921daaf000e347114cf44187&page=\(page)"
    
    let request = AF.request(url, method: .get)
    
   
    
    request.responseDecodable(of: Trends.self) { response in
        

        do {
            let data = try response.result.get().results
            completion(data)
            
            
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
}
