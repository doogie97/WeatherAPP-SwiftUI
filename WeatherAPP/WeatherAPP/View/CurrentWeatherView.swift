//
//  CurrentWeatherView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

struct CurrentWeatherView: View {
    let currentWeather: CurrentWeather?
    var body: some View {
        VStack(alignment: .leading) {
            if let currentWeather = currentWeather {
                HStack {
                    Image(systemName: currentWeather.icon)
                        .symbolRenderingMode(.multicolor)
                    Text(currentWeather.weather)
                }
                .font(.largeTitle)
                HStack(spacing: 20) {
                    Label(currentWeather.maxTemperature,
                          systemImage: "arrow.up")
                    Label(currentWeather.minTemperature,
                          systemImage: "arrow.down")
                }
                
                HStack(alignment: .lastTextBaseline) {
                    Text(currentWeather.temperature)
                        .font(.system(size: 120))
                        .fontWeight(.ultraLight)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "sunrise.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(currentWeather.sunriseTime)
                            .font(.caption)
                        Image(systemName: "sunset.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(currentWeather.sunsetTime)
                            .font(.caption)
                    }
                }
            }
        }
                .foregroundStyle(.white)
                .padding(.horizontal)
    }
}

#Preview {
    CurrentWeatherView(currentWeather: CurrentWeather.preview)
        .preferredColorScheme(.dark)
}
