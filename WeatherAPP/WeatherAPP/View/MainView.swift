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
            WeatherContentView()
        }
        .onAppear {
            weatherService.fetch()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(WeatherService.preview)
}
