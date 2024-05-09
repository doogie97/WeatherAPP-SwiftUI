//
//  WidgetData.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation

struct WidgetData: Codable {
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
  
  static let dataURL = FileManager.sharedContainer?.appendingPathComponent("widgetData.json")
  
  static func wirte(location: String?, currentWeather: CurrentWeather?, forecast: [Forecast]?) {
    guard let location = location,
          let currentWeather = currentWeather,
          let forecast = forecast,
          let dataURL = dataURL else {
      return
    }
    
    var list = [WidgetData]()
    let data = WidgetData(date: currentWeather.forecastedDate,
                          location: location,
                          temperature: currentWeather.temperature,
                          minTemperature: currentWeather.minTemperature,
                          maxTemperature: currentWeather.maxTemperature,
                          icon: currentWeather.icon,
                          weather: currentWeather.weather)
    list.append(data)
    list.append(contentsOf: forecast.compactMap {
      return WidgetData(date: $0.forecasetedDate,
                        location: location,
                        temperature: $0.temperature,
                        minTemperature: $0.minTemperature,
                        maxTemperature: $0.maxTemperature,
                        icon: $0.icon,
                        weather: $0.weather)
    })
    
    do {
      let encoder = JSONEncoder()
      let data = try encoder.encode(list)
      try data.write(to: dataURL)
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  static func read() -> [WidgetData] {
    guard let dataURL = dataURL,
          let data = try? Data(contentsOf: dataURL) else {
      return []
    }
    
    let decoder = JSONDecoder()
    do {
      return try decoder.decode([WidgetData].self, from: data)
    } catch let error {
      print(error.localizedDescription)
      return []
    }
  }
}
