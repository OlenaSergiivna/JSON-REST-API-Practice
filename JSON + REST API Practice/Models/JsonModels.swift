//
//  File.swift
//  JSON + REST API Practice
//
//  Created by user on 05.09.2022.
//

import Foundation


struct Company: Codable {
    
    var count: Int?
    var companyDescription: String?
    var listOfData: [Device]?
    
    
    enum CodingKeys: String, CodingKey {
        case count
        case companyDescription = "company description"
        case listOfData = "list of data"
        
    }
}

struct Device: Codable {
    
    var nameDevice: String
    var modelNumber: String
    var countries: [String]
    var priceDevice: PriceInfo
    var year: Int
    
    
    enum CodingKeys: String, CodingKey{
        case countries, year
        case nameDevice = "name"
        case priceDevice = "price"
        case modelNumber = "model number"
        
    }
}

struct PriceInfo: Codable {
    
    var regions: [RegionPrice]
    
}


struct RegionPrice: Codable {
    
    var nameRegion: String
    var priceRegion: Int
    
    
    enum CodingKeys: String, CodingKey {
        case nameRegion = "name"
        case priceRegion = "price"
        
    }
}
