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
    
    @MainActor
    func fetchCurrentWeather(location: CLLocation) async {
        do {
            let dto: CurrentWeatherDTO = try await fetch(location: location,
                                                         apiType: .weather)
            self.currentWeather = CurrentWeather(data: dto)
        } catch {
            lastError = "API 요청 실패"
        }
    }
    
    @MainActor
    func fetchForeCastList(location: CLLocation) async {
        do {
            let dto: ForecastDTO = try await fetch(location: location, apiType: .forecast)
            self.forecaseList = dto.list?.compactMap {
                return Forecast(data: $0)
            }
        } catch {
            lastError = "API 요청 실패"
        }
    }
    
    private func fetch<T: Decodable>(location: CLLocation, apiType: ApiType) async throws -> T {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/\(apiType.rawValue)")
        components?.queryItems = [
            URLQueryItem(name: "appid", value: Self.apiKey),
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
