//
//  APIError.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

enum APIError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
