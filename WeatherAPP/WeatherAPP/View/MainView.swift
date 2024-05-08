//
//  MainView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var weatherService: WeatherService
    var body: some View {
        ZStack {
            MainBackgroundView()
            
            if weatherService.isUpdating {
                ProgressView()
                    .tint(.white)
            } else {
                WeatherContentView()
            }
        }
        .animation(.easeInOut, value: weatherService.isUpdating)
        .onAppear {
            weatherService.fetch()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(WeatherService.preview)
}
