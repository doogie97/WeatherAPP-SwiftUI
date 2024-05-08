//
//  ErrorView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/8/24.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var weatherService: WeatherService
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.circle")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            if let error = weatherService.lastError {
                Text(error)
                    .padding()
                    .foregroundStyle(.white)
            }
            
            Button {
                weatherService.lastError = nil
                weatherService.fetch()
            } label: {
                Text("재요청")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ErrorView()
        .environmentObject(WeatherService.preview)
}
