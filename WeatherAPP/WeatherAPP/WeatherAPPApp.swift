//
//  WeatherAPPApp.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

@main
struct WeatherAPPApp: App {
    private let service = WeatherService()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(service)
        }
    }
}
