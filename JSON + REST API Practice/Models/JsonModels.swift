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
    var listOfData: [Device?]
    
    
    enum CodingKeys: String, CodingKey {
        case count
        case companyDescription = "company description"
        case listOfData = "list of data"
    }
}

struct Device: Codable {
    
    var name: String?
    var modelNumber: String?
    var countries: [String?]
    var price: [PriceInfo?]
    var year: Int?
    
    
    enum CodingKeys: String, CodingKey{
        case name, countries, price, year
        case modelNumber = "model number"
    }
    
    
}

struct PriceInfo: Codable {
    
    var regions: [RegionPrice?]
    
}


struct RegionPrice: Codable {
    
    var name: String?
    var price: Int?
    
}
