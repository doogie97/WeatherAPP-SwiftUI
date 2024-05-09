//
//  Forecast.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import Foundation

struct Forecast: Identifiable {
    var id = UUID()
    
    let date: String
    let time: String
    let icon: String
    let weather: String
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let forecasetedDate: Date
}

extension Forecast {
    static var preview: [Forecast] {
        return (0..<10).map {
            let date = Date.now.addingTimeInterval(TimeInterval($0 * 3600 * 24))
            
            return Forecast(date: date.formatted(.dateTime.month().day()),
                            time: date.formatted(.dateTime.hour().minute()),
                            icon: "sun.max.fill",
                            weather:"맑음",
                            temperature: Double.random(in: -10..<30).temperatureString,
                            minTemperature: Double.random(in: -10..<00).temperatureString,
                            maxTemperature: Double.random(in: 00..<30).temperatureString,
                            forecasetedDate: .now)
        }
    }
    
    init?(data: ForecastDTO.ListItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let date = Date(timeIntervalSince1970: TimeInterval((data.dt ?? 0)))
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMd")
        self.date = dateFormatter.string(from: date)
        dateFormatter.setLocalizedDateFormatFromTemplate("jm")
        self.time = dateFormatter.string(from: date)
        self.icon = (data.weather?.first?.icon ?? "").weatherImagename
        self.weather = data.weather?.first?.description ?? ""
        self.temperature = data.main?.temp?.temperatureString ?? ""
        self.minTemperature = data.main?.temp_min?.temperatureString ?? ""
        self.maxTemperature = data.main?.temp_max?.temperatureString ?? ""
        self.forecasetedDate = date
    }
}
