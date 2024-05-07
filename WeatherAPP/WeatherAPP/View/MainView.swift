//
//  MainView.swift
//  WeatherAPP
//
//  Created by Doogie on 5/7/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            MainBackgroundView()
            WeatherContentView()
        }
    }
}

#Preview {
    MainView()
}
