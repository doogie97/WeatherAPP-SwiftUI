//
//  WeatherService+Location.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import Foundation
import CoreLocation
import WidgetKit

extension WeatherService: CLLocationManagerDelegate {
    private func updateAddress(from location: CLLocation) async throws -> String {
        let geocoder = CLGeocoder()
        let placemarks = try await geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "Ko_kr"))
        
        if let placemark = placemarks.first {
            if let gu = placemark.locality,
               let dong = placemark.subLocality {
                return "\(gu) \(dong)"
            } else {
                return placemark.name ?? "알 수 없음"
            }
        }
        
        return "알 수 없음"
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            lastError = "위치 서비스 사용 권한을 확인할 수 없습니다."
            isUpdating = false
        case .denied, .restricted:
            lastError = "위치 서비스 사용 권한이 없습니다."
            isUpdating = false
        @unknown default:
            lastError = "알 수 없는 오류가 발생했습니다."
            isUpdating = false
        }
    }
    
    private func process(location: CLLocation) {
        guard !isPreviewService else {
            isUpdating = false
            return
        }
        
        Task {
            await fetchCurrentWeather(location: location)
            await fetchForeCastList(location: location)
            let locationStr = try await updateAddress(from: location)
            WidgetData.wirte(location: locationStr, currentWeather: currentWeather, forecast: forecaseList)
            WidgetCenter.shared.reloadAllTimelines()
            await MainActor.run {
                currentLocaion = locationStr
                isUpdating = false
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            process(location: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lastError = error.localizedDescription
        isUpdating = false
    }
}
