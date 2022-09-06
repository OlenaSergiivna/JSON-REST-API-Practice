//
//  GendersModels.swift
//  JSON + REST API Practice
//
//  Created by user on 06.09.2022.
//

import Foundation


struct Genres: Codable {
    let genres: [Genre]
}


struct Genre: Codable {
    let id: Int
    let name: String
}
