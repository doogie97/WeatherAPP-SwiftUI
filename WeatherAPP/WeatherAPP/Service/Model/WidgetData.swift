//
//  WidgetData.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation

struct WidgetData {
    let date: Date
    let location: String
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let icon: String
    let weather: String
}

extension WidgetData {
    static let preview = WidgetData(date: .now,
                                    location: "명왕성",
                                    temperature: 20.temperatureString,
                                    minTemperature: 10.temperatureString,
                                    maxTemperature: 24.temperatureString,
                                    icon: "sun.max.fill",
                                    weather: "겁나 맑음")
}
