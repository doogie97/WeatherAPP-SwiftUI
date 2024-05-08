//
//  WeatherService+API.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation
import CoreLocation

extension WeatherService {
    enum ApiType: String {
        case forecast
        case weather
    }
    
    func fetchCurrentWeather(location: CLLocation) async {
        do {
            self.currentWeather = CurrentWeather(data: try await fetch(location: location, 
                                                                       apiType: .weather))
        } catch {
            lastError = "API 요청 실패"
        }
    }
    
    
    private func fetch<T: Decodable>(location: CLLocation, apiType: ApiType) async throws -> T {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/\(apiType.rawValue)")
        components?.queryItems = [
            URLQueryItem(name: "appid", value: self.apiKey),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "lang", value: "kr"),
            URLQueryItem(name: "lat", value: "\(location.coordinate.latitude)"),
            URLQueryItem(name: "lon", value: "\(location.coordinate.longitude)")
        ]
        
        guard let url = components?.url else {
            throw APIError.invalidUrl(components?.host ?? "")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200..<300).contains(response.statusCode) else {
            throw APIError.failed(response.statusCode)
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
    }
}
