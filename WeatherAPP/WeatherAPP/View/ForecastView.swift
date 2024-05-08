//
//  ForecastView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ForEach(Forecast.preview) { forecase in
            HStack {
                VStack(alignment: .leading) {
                    Text(forecase.date)
                    Text(forecase.time)
                }
                .font(.caption)
                
                Spacer()
                
                Image(systemName: forecase.icon)
                    .symbolRenderingMode(.multicolor)
                Text(forecase.weather)
                
                Spacer()
                
                Text(forecase.temperature)
                    .font(.system(size: 40))
                    .fontWeight(.ultraLight)
                    .frame(minWidth: 70, alignment: .trailing)
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ForecastView()
        .preferredColorScheme(.dark)
}
