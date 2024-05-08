//
//  WeatherContentView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

struct WeatherContentView: View {
    var body: some View {
        VStack {
            Text("강남역")
                .font(.title2)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Color.clear
                        CurrentWeatherView(currentWeather: CurrentWeather.preview)
                    }
                    .frame(height: reader.size.height)
                    
                    Spacer(minLength: reader.safeAreaInsets.bottom)
                    
                    ForecastView()
                }
            }
        }
    }
}

#Preview {
    WeatherContentView()
        .preferredColorScheme(.dark)
}
