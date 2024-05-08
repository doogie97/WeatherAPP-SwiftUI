//
//  CurrentWeather.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import Foundation

struct CurrentWeather {
    let icon: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
    let sunriseTime: String
    let sunsetTime: String
    let forecastedDate: Date
}

extension CurrentWeather {
    static var preview: CurrentWeather {
        return CurrentWeather(icon: "sun.max.fill",
                              weather: "맑음",
                              temperature: 20.temperatureString,
                              maxTemperature: 35.temperatureString,
                              minTemperature: 10.temperatureString,
                              sunriseTime: "오전 6:00",
                              sunsetTime: "우후 6:00",
                              forecastedDate: .now)
    }
}
