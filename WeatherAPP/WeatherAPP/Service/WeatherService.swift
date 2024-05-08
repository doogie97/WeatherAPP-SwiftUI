//
//  WeatherService.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation
import CoreLocation

class WeatherService: NSObject, ObservableObject {
    static let apiKey = "f6aadde19222caad1dd9dc2ae340c89e"
    
    let locationManager: CLLocationManager
    
    @Published var currentLocaion: String?
    
    @Published var currentWeather: CurrentWeather?
    @Published var forecaseList: [Forecast]?
    
    @Published var lastError: String?
    
    @Published var isUpdating: Bool
    
    let isPreviewService: Bool
    
    init(isPreview: Bool = false) {
        self.isPreviewService = isPreview
        self.isUpdating = false
        
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
    
    func fetch() {
        guard !isPreviewService else {
            return
        }
        
        isUpdating = true
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation()
        case .denied, .restricted:
            lastError = "위치 서비스 사용 권한이 없습니다."
            isUpdating = false
        default:
            lastError = "알 수 없는 오류가 발생했습니다."
            isUpdating = false
        }
    }
}
