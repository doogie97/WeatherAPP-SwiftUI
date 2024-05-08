//
//  ForecastDTO.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation

struct ForecastDTO: Decodable {
    let cnt: Int?
    let list: [ListItem]?
    
    struct ListItem: Decodable {
        let dt: Double?
        let main: Main?
        let weather: [Weather]?
    }
    
    struct Main: Decodable {
        let temp: Double?
        let temp_min: Double?
        let temp_max: Double?
    }
    
    struct Weather: Decodable {
        let description: String?
        let icon: String?
    }
}
