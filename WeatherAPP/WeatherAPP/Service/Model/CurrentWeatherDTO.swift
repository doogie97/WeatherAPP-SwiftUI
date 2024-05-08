//
//  CurrentWeatherDTO.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation

struct CurrentWeatherDTO: Decodable {
    let dt: Double?
    let weather: [Weather]?
    let main: Main?
    let sys: Sys?
    
    struct Weather: Decodable {
        let description: String?
        let icon: String?
    }
    
    struct Main: Decodable {
        let temp: Double?
        let temp_min: Double?
        let temp_max: Double?
    }
    
    struct Sys: Decodable {
        let sunrise: Double?
        let sunset: Double?
    }
}
