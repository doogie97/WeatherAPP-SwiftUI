//
//  WeatherService.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation
import CoreLocation

class WeatherService: NSObject, ObservableObject {
    let locationManager: CLLocationManager
    
    @Published var currentLocaion: String?
    
    @Published var currentWeather: CurrentWeather?
    @Published var forecaseList: [Forecast]?
    
    @Published var lastError: String?
    
    let isPreviewService: Bool
    
    init(isPreview: Bool = false) {
        self.isPreviewService = isPreview
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        super.init()
        
        locationManager.delegate = self
    }
    
    static var preview: WeatherService {
        let service = WeatherService(isPreview: true)
        service.currentLocaion = "굴포천역"
        service.currentWeather = CurrentWeather.preview
        service.forecaseList = Forecast.preview
        return service
    }
}
